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

DO
$$
    DECLARE
        randomWord         VARCHAR;
        latestVocabularyId UUID;
        latestUserId       UUID;
        totalUsers         INT4;
        totalVocabPerUser  INT4;
        userIds            UUID[];

    BEGIN
        totalUsers := 50;
        userIds := '{}';
        userIds := ARRAY_APPEND(userIds, CURRENT_SETTING('my.userId')::UUID);

        INSERT INTO "User" (id, email)
        VALUES (CURRENT_SETTING('my.userId')::UUID, 'ehasan+1@firecrackervocabulary.com')
        ON CONFLICT (email) DO NOTHING;

        FOR i IN 2..totalUsers
            LOOP
                INSERT INTO "User" (email)
                VALUES (CONCAT('ehasan+', i::VARCHAR, '@firecrackervocabulary.com'))
                RETURNING id INTO latestUserId;
                userIds := ARRAY_APPEND(userIds, latestUserId);
            END LOOP;

        totalVocabPerUser := 5000;

        FOR i IN 1..totalUsers
            LOOP
                FOR j IN 1..totalVocabPerUser
                    LOOP
                        randomWord :=
                                CONCAT("getRandomString"(MOD(j, 5) + 1),
                                       LPAD(j::VARCHAR, LENGTH(totalVocabPerUser::VARCHAR), '0'));
                        INSERT INTO "Vocabulary" (word, "userId")
                        VALUES (randomWord, userIds[i])
                        RETURNING id
                            INTO latestVocabularyId;

                        INSERT INTO "Definition" (meaning, "vocabularyId")
                        VALUES ('Meaning1', latestVocabularyId),
                               ('Meaning2', latestVocabularyId);
                    END LOOP;
            END LOOP;

    END
$$;
