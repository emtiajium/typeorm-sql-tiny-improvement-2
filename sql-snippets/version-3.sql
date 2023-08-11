SET SESSION my.userId = '41f89c90-7029-46a4-8211-5f8c6e527a2d';

-- version 3
SELECT vocabulary.id,
       vocabulary.word,
       definitions,
       (COUNT(*) OVER ())::INTEGER AS total
FROM "Vocabulary" AS vocabulary
         LEFT JOIN LATERAL (
    SELECT JSON_AGG(JSON_BUILD_OBJECT('id', definition.id, 'meaning', definition.meaning)) AS definitions
    FROM "Definition" AS definition
    WHERE definition."vocabularyId" = vocabulary.id
    ) AS definitions ON TRUE
WHERE vocabulary."userId" = CURRENT_SETTING('my.userId')::UUID
ORDER BY vocabulary.word DESC
OFFSET 4980 LIMIT 20;
