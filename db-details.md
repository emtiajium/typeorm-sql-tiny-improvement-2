## User

| Column | Type              | Nullable | Default            |
| ------ | ----------------- | -------- | ------------------ |
| id     | uuid              | not null | uuid_generate_v4() |
| email  | character varying | not null |                    |

## Vocabulary

| Column | Type              | Nullable | Default            |
| ------ | ----------------- | -------- | ------------------ |
| id     | uuid              | not null | uuid_generate_v4() |
| word   | character varying | not null |                    |
| userId | uuid              |          |                    |

## Definition

| Column       | Type              | Nullable | Default            |
| ------------ | ----------------- | -------- | ------------------ |
| id           | uuid              | not null | uuid_generate_v4() |
| meaning      | character varying | not null |                    |
| vocabularyId | uuid              | not null |                    |

## Index Keys

| Table Name | Index Name                | Index Definition                                                                                    |
| ---------- | ------------------------- | --------------------------------------------------------------------------------------------------- |
| Definition | PK_Definition_id          | CREATE UNIQUE INDEX "PK_Definition_id" ON public."Definition" USING btree (id)                      |
| Migration  | PK_Migration_id           | CREATE UNIQUE INDEX "PK_Migration_id" ON public."Migration" USING btree (id)                        |
| User       | PK_User_id                | CREATE UNIQUE INDEX "PK_User_id" ON public."User" USING btree (id)                                  |
| Vocabulary | PK_Vocabulary_id          | CREATE UNIQUE INDEX "PK_Vocabulary_id" ON public."Vocabulary" USING btree (id)                      |
| User       | UQ_User_email             | CREATE UNIQUE INDEX "UQ_User_email" ON public."User" USING btree (email)                            |
| Vocabulary | UQ_Vocabulary_word_userId | CREATE UNIQUE INDEX "UQ_Vocabulary_word_userId" ON public."Vocabulary" USING btree (word, "userId") |

## Foreign Key

| Table Name | Column       | Constraint Name                          | Foreign Constraint Definition                                                                                                                                                        |
| ---------- | ------------ | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Vocabulary | userId       | FK_Vocabulary_userId_User_id             | ALTER TABLE "Vocabulary" ADD CONSTRAINT "FK_Vocabulary_userId_User_id" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION                       |
| Definition | vocabularyId | FK_Definition_vocabularyId_Vocabulary_id | ALTER TABLE "Definition" ADD CONSTRAINT "FK_Definition_vocabularyId_Vocabulary_id" FOREIGN KEY ("vocabularyId") REFERENCES "Vocabulary" ("id") ON DELETE CASCADE ON UPDATE NO ACTION |
