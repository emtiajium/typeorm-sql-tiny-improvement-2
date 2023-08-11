-- TypeORM generates 3 queries when getManyAndCount() gets executed

-- query 1
SELECT DISTINCT "distinctAlias"."vocabulary_id" AS "ids_vocabulary_id", "distinctAlias"."vocabulary_word"
FROM (SELECT "vocabulary"."id"      AS "vocabulary_id",
             "vocabulary"."word"    AS "vocabulary_word",
             "definition"."id"      AS "definition_id",
             "definition"."meaning" AS "definition_meaning"
      FROM "Vocabulary" "vocabulary"
               LEFT JOIN "Definition" "definition" ON "definition"."vocabularyId" = "vocabulary"."id"
      WHERE "vocabulary"."userId" = '41f89c90-7029-46a4-8211-5f8c6e527a2d') "distinctAlias"
ORDER BY "distinctAlias"."vocabulary_word" DESC, "vocabulary_id" ASC
LIMIT 20 OFFSET 4980;

-- [].map(_ => `'${_}'`).join(', ');

-- query 2
SELECT "vocabulary"."id"      AS "vocabulary_id",
       "vocabulary"."word"    AS "vocabulary_word",
       "definition"."id"      AS "definition_id",
       "definition"."meaning" AS "definition_meaning"
FROM "Vocabulary" "vocabulary"
         LEFT JOIN "Definition" "definition" ON "definition"."vocabularyId" = "vocabulary"."id"
WHERE ("vocabulary"."userId" = '41f89c90-7029-46a4-8211-5f8c6e527a2d')
  AND ("vocabulary"."id" IN
       ('41f89c90-7029-46a4-8211-5f8c6e527a2d', '240881de-1458-48af-9088-708649c02026',
        '9d220c0e-748d-4ac2-b2c9-7a609083bdc3', 'b2a69d8c-c91a-44e1-9ae7-241dfeaba61a',
        '95694546-1961-4bd6-ba6b-594a53fc9d9b', '5883a68e-9860-4c00-b732-c23044895d8f',
        '2fb1728b-85a8-4244-aaf6-9ca5e4263ccb', '2e36c1ef-2a49-4adb-bec1-b8cd2acb0c63',
        '68193792-356e-437e-abfc-c8dae0b948c9', '6a2bc3e6-d83a-4f0e-a542-1f7dd0a67dde',
        '0126e08f-e5fe-4c7c-a949-95177138e73e', 'f694e6e4-58b2-408e-a1bc-452183468b50',
        '16b42ff8-a5c8-41d4-bae1-32bd27edca17', '02a0d5aa-a590-4f82-890f-41bbe9964615',
        '28fe5efb-fb40-472f-bd1a-33bad93a1a0a', '81ac7e0d-cc49-4232-9a40-dc0fb0bdacc6',
        '4b81849e-a79f-40cc-a52a-b7695b123fe4', 'b94d6820-6f18-43ea-8e73-43fb17cec107',
        '0b0a681c-8a95-44b5-bbb4-ae272ab2fa56', '88910fc7-c856-4fa6-896f-e669ab4c3680',
        '46691da5-278e-4e1a-9729-f0131ce347c1'))
ORDER BY "vocabulary_word" DESC;

-- query 3
SELECT COUNT(DISTINCT ("vocabulary"."id")) AS "cnt"
FROM "Vocabulary" "vocabulary"
         LEFT JOIN "Definition" "definition" ON "definition"."vocabularyId" = "vocabulary"."id"
WHERE "vocabulary"."userId" = '41f89c90-7029-46a4-8211-5f8c6e527a2d';
