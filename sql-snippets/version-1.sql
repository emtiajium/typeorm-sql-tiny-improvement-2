SET SESSION my.userId = '41f89c90-7029-46a4-8211-5f8c6e527a2d';

-- version 1
SELECT vocabulary.id,
       vocabulary.word,
       JSON_AGG(JSON_BUILD_OBJECT('id', definition.id, 'meaning', definition.meaning)) AS definitions,
       (COUNT(*) OVER ())::INTEGER                                                     AS total
FROM "Vocabulary" AS vocabulary
         LEFT JOIN "Definition" AS definition ON vocabulary.id = definition."vocabularyId"
WHERE vocabulary."userId" = CURRENT_SETTING('my.userId')::UUID
GROUP BY vocabulary.id, vocabulary.word
ORDER BY vocabulary.word DESC
OFFSET 4980 LIMIT 20;
