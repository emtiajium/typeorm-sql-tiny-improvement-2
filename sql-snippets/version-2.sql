SET SESSION my.userId = '41f89c90-7029-46a4-8211-5f8c6e527a2d';

-- version 2
SELECT vocabulary.id, vocabulary.word, vocabulary.definitions, vocabulary.total
FROM (SELECT vocabulary.id,
             vocabulary.word,
             JSON_AGG(JSON_BUILD_OBJECT('id', definition.id, 'meaning', definition.meaning)) AS definitions,
             (COUNT(*) OVER ())::INTEGER                                                     AS total,
             ROW_NUMBER() OVER (ORDER BY vocabulary.word DESC)                               AS "rowNumber"
      FROM "Vocabulary" AS vocabulary
               LEFT JOIN "Definition" AS definition ON vocabulary.id = definition."vocabularyId"
      WHERE vocabulary."userId" = CURRENT_SETTING('my.userId')::UUID
      GROUP BY vocabulary.id, vocabulary.word) vocabulary
WHERE vocabulary."rowNumber" BETWEEN 4981 AND 5000;
