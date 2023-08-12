-- total user
SELECT COUNT(*) AS "totalUser"
FROM "User";

-- total vocabulary
SELECT COUNT(*) AS "totalVocabulary"
FROM "Vocabulary";

-- total vocabulary per user
SELECT vocab."userId", COUNT(*) AS "totalVocabularyPerUser"
FROM "Vocabulary" vocab
GROUP BY vocab."userId";

-- total definition
SELECT COUNT(*) AS "totalDefinition"
FROM "Definition" definition;

-- total definition per user
SELECT vocab."userId", COUNT(definition.id) AS "totalDefinitionPerUser"
FROM "Definition" definition
         LEFT JOIN "Vocabulary" vocab ON definition."vocabularyId" = vocab.id
GROUP BY vocab."userId";
