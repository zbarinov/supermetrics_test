START TRANSACTION;

CREATE TABLE IF NOT EXISTS `posts`
(
    `id`             varchar(26)                                        NOT NULL,
    `from_name`      varchar(200)                                       NOT NULL,
    `from_id`        varchar(200)                                       NOT NULL,
    `message`        text                                               NOT NULL,
    `message_length` int                                                NOT NULL,
    `type`           varchar(20)                                        NOT NULL,
    `created_time`   datetime                                           NOT NULL,
    `month`          char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `week`           tinyint UNSIGNED                                   NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

ALTER TABLE `posts`
    ADD PRIMARY KEY (`id`),
    ADD KEY `idx_month_message_length` (`month`, `message_length`) USING BTREE,
    ADD KEY `idx_week` (`week`) USING BTREE;

CREATE TABLE IF NOT EXISTS `total_posts_per_user_per_month`
(
    `total_posts` int                                                     NOT NULL,
    `month`       char(7) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL,
    `from_name`   varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

ALTER TABLE `total_posts_per_user_per_month`
    ADD UNIQUE KEY `idx_month_from_name` (`month`,`from_name`);

COMMIT;
