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
       ('41f89c90-7029-46a4-8211-5f8c6e527a2d', 'b19457a9-03fb-4c3b-b649-83001b6b9616',
        '17d84794-88a0-4e62-9f1c-88dea1fe8148', '9381945a-14d5-458b-b283-870ba3fa2057',
        'c00d27cb-7ad1-4fd4-9641-73d3484f3741', '34e8fc07-dec6-4dc8-b461-ed412a5f1cc8',
        'c5a52ddf-328f-4f1f-8c19-e38bc5d74ce1', '70de43d8-dbf2-45a4-86f1-1c4a0dc07512',
        '9150aff2-27b0-499e-82de-7a15373f35b0', '25aa3d73-5e50-410a-b16a-522246b54982',
        '3bf46a90-6982-46ac-9414-a5b3d36e9340', '05c26854-bfe2-48b3-ae2b-c3a76e26a473',
        '40808019-f2c1-4857-8bab-a1820cfb974f', '5cb2e93d-c64c-407c-bfd2-5b765f630298',
        '0fdf440c-37cd-46c3-a305-bd3b8937c377', '3fd8baf6-7e5e-4008-a8ef-81e30fcb6b0b',
        '9501f02f-b77c-4abc-b6ef-fe1a44a575f3', 'cf6c5111-9077-4c9f-9d1b-07eeb44a7160',
        '83c4e918-b14e-4848-ac16-e6e88fa6d774', 'ae156eb4-5a94-431a-8c1f-6b384d062e3b',
        'b44b3033-1b54-4d3f-93a0-c73477dddf68'))
ORDER BY "vocabulary_word" DESC;

-- query 3
SELECT COUNT(DISTINCT ("vocabulary"."id")) AS "cnt"
FROM "Vocabulary" "vocabulary"
         LEFT JOIN "Definition" "definition" ON "definition"."vocabularyId" = "vocabulary"."id"
WHERE "vocabulary"."userId" = '41f89c90-7029-46a4-8211-5f8c6e527a2d';
