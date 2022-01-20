-- CreateTable
CREATE TABLE `Post` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(256) NULL,
    `content` VARCHAR(256) NULL,
    `published` BOOLEAN NULL,
    `authorId` INTEGER NULL,

    INDEX `author`(`authorId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(256) NULL,
    `email` VARCHAR(256) NULL,

    UNIQUE INDEX `email`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateView
CREATE VIEW `Draft` (
    `published`,
    `title`,
    `email`,
    `id`
) AS SELECT 
    published, 
    title, 
    email, 
    Post.id
FROM `Post`
JOIN `User` ON `Post`.`authorId` = `User`.`id`
WHERE published = false;

-- AddForeignKey
ALTER TABLE `Post` ADD CONSTRAINT `author` FOREIGN KEY (`authorId`) REFERENCES `User`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
