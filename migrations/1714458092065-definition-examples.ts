import { MigrationInterface, QueryRunner } from 'typeorm';

export class DefinitionExamples1714458092065 implements MigrationInterface {
    name = 'DefinitionExamples1714458092065';

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "Definition"
                ADD "examples" jsonb DEFAULT '[]'
        `);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "Definition"
                DROP COLUMN "examples"
        `);
    }
}
