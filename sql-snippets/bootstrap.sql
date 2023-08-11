-- drop
TRUNCATE "Definition" CASCADE;
TRUNCATE "Vocabulary" CASCADE;
TRUNCATE "User" CASCADE;

-- method to generate word
DROP FUNCTION IF EXISTS "getRandomString"(INT4);
CREATE FUNCTION "getRandomString"(randomNumber INT4)
    RETURNS VARCHAR
    LANGUAGE PLPGSQL AS
$$
DECLARE
    startingIndex INT4;
    endingIndex   INT4;
BEGIN
    startingIndex := MOD(randomNumber, 20);
    endingIndex := startingIndex + 5;
    RETURN SUBSTR('abcdefghijklmnopqrstuvwxyz', startingIndex, endingIndex);
END
$$;

-- insert
SET SESSION my.userId = '41f89c90-7029-46a4-8211-5f8c6e527a2d';

INSERT INTO "User" (id, email)
VALUES (CURRENT_SETTING('my.userId')::UUID, 'ehasan@firecrackervocabulary.com')
ON CONFLICT (email) DO NOTHING;

DO
$$
    DECLARE
        randomWord         VARCHAR;
        latestVocabularyId UUID;
        totalVocabs        INT4;
    BEGIN
        totalVocabs := 5000;
        FOR i IN 1..totalVocabs
            LOOP
                randomWord :=
                        CONCAT("getRandomString"(MOD(i, 5) + 1), LPAD(i::VARCHAR, LENGTH(totalVocabs::VARCHAR), '0'));
                INSERT INTO "Vocabulary" (word, "userId")
                VALUES (randomWord, CURRENT_SETTING('my.userId')::UUID)
                RETURNING id
                    INTO latestVocabularyId;

                FOR j IN 1..5
                    LOOP
                        INSERT INTO "Definition" (meaning, "vocabularyId")
                        VALUES (CONCAT('Meaning', j), latestVocabularyId);
                    END LOOP;
            END LOOP;
    END
$$;
