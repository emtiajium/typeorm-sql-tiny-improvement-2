import { INestApplication } from '@nestjs/common';
import { kickOff } from '@/bootstrap';
import { AppModule } from '@/app/AppModule';
import { VocabularyRepository } from '@/app/repositories/VocabularyRepository';
import Vocabulary from '@/app/domains/entities/Vocabulary';

describe('Vocabulary Repository', () => {
    let app: INestApplication;

    beforeAll(async () => {
        app = await kickOff(AppModule);
    });

    afterAll(async () => {
        await app.close();
    });

    it('SHOULD return vocabs', async () => {
        // Act
        const queryResult = await app
            .get(VocabularyRepository)
            .createQueryBuilder('vocabulary')
            .leftJoin('vocabulary.definitions', 'definition')
            .where(`vocabulary.userId = :userId`, { userId: '41f89c90-7029-46a4-8211-5f8c6e527a2d' })
            .select(['vocabulary.id', 'vocabulary.word'])
            .addSelect(['definition.id', 'definition.meaning'])
            .orderBy(`vocabulary.word`, 'DESC')
            .skip(4980)
            .take(20)
            .getManyAndCount();

        // Assert
        expect(queryResult[1]).toBeGreaterThanOrEqual(5000);
        expect(queryResult[0][0]).toBeInstanceOf(Vocabulary);
    });
});
