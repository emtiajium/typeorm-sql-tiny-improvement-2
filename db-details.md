## User

```
| Column | Type              | Nullable | Default            |
| ------ | ----------------- | -------- | ------------------ |
| id     | uuid              | not null | uuid_generate_v4() |
| email  | character varying | not null |                    |
```

## Vocabulary

```
| Column | Type              | Nullable | Default            |
| ------ | ----------------- | -------- | ------------------ |
| id     | uuid              | not null | uuid_generate_v4() |
| word   | character varying | not null |                    |
| userId | uuid              |          |                    |
```

## Definition

```
| Column       | Type              | Nullable | Default            |
| ------------ | ----------------- | -------- | ------------------ |
| id           | uuid              | not null | uuid_generate_v4() |
| meaning      | character varying | not null |                    |
| vocabularyId | uuid              | not null |                    |
```

## Index Keys

```
| Table Name | Index Name                | Index Definition                                                                                    |
| ---------- | ------------------------- | --------------------------------------------------------------------------------------------------- |
| User       | PK_User_id                | CREATE UNIQUE INDEX "PK_User_id" ON public."User" USING btree (id)                                  |
| User       | UQ_User_email             | CREATE UNIQUE INDEX "UQ_User_email" ON public."User" USING btree (email)                            |
| Vocabulary | PK_Vocabulary_id          | CREATE UNIQUE INDEX "PK_Vocabulary_id" ON public."Vocabulary" USING btree (id)                      |
| Vocabulary | UQ_Vocabulary_word_userId | CREATE UNIQUE INDEX "UQ_Vocabulary_word_userId" ON public."Vocabulary" USING btree (word, "userId") |
| Definition | PK_Definition_id          | CREATE UNIQUE INDEX "PK_Definition_id" ON public."Definition" USING btree (id)                      |
```

## Foreign Key

```
| Table Name | Column       | Constraint Name                          | Foreign Constraint Definition  |
| ---------- | ------------ | ---------------------------------------- | ------------------------------ |
| Vocabulary | userId       | FK_Vocabulary_userId_User_id             | REFERENCES "User" ("id")       |
| Definition | vocabularyId | FK_Definition_vocabularyId_Vocabulary_id | REFERENCES "Vocabulary" ("id") |
```
