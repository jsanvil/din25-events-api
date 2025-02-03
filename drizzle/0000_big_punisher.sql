CREATE TABLE `events` (
	`id` text(36) PRIMARY KEY DEFAULT (lower(hex(randomblob(16)))) NOT NULL,
	`title` text(50) NOT NULL,
	`description` text(200) DEFAULT '',
	`location` text(100) NOT NULL,
	`date` text NOT NULL,
	`price` real DEFAULT 0 NOT NULL,
	`image` text DEFAULT '',
	`userId` text,
	`created_at` text DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` text DEFAULT (CURRENT_TIMESTAMP),
	FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` text(36) PRIMARY KEY DEFAULT (lower(hex(randomblob(16)))) NOT NULL,
	`name` text(128) DEFAULT 'noname',
	`username` text(128) NOT NULL,
	`email` text(128) NOT NULL,
	`password` text(128) NOT NULL,
	`role` text(128) DEFAULT 'user',
	`created_at` text DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` text DEFAULT (CURRENT_TIMESTAMP)
);
--> statement-breakpoint
CREATE UNIQUE INDEX `users_username_unique` ON `users` (`username`);--> statement-breakpoint
CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);