-- here is our MLD with their types :
-- list ( id INTEGER, name TEXT, position INTEGER created_at TIMESTAMPTZ, updated_at TIMESTAMPTZ)
-- card ( id INTEGER, description TEXT, position INTEGER, color TEXT, #list(id) INTEGER, created_at TIMESTAMPTZ, updated_at TIMESTAMPTZ)
-- tag ( id INTEGER, name TEXT, color TEXT, created_at TIMESTAMPTZ, updated_at TIMESTAMPTZ)
-- card_has_tag ( #card(id) INTEGER, #tag(id) INTEGER, created_at TIMESTAMPTZ)

BEGIN;

DROP TABLE IF EXISTS "list", 
"card", 
"tag", 
"card_has_tag";


CREATE TABLE "list" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL DEFAULT '',
    "position" INTEGER NOT NULL DEFAULT 0,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "card" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "description" TEXT NOT NULL DEFAULT '',
    "position" INTEGER NOT NULL DEFAULT 0,
    "color" TEXT NOT NULL DEFAULT '#FFF',

    "list_id" INTEGER NOT NULL REFERENCES list("id") ON DELETE CASCADE,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "tag" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL DEFAULT '',
    "color" TEXT NOT NULL DEFAULT '#FFF',
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "card_has_tag" (
    "card_id" INTEGER NOT NULL REFERENCES card("id") ON DELETE CASCADE,
    "tag_id" INTEGER NOT NULL REFERENCES tag("id") ON DELETE CASCADE,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ
);


-- here is a little seeding

INSERT INTO "list" ("name", "position")
VALUES  ('IN PROGRESS', 2),
        ('TO DO', 1);

INSERT INTO "card" ("description", "position", "color", "list_id")
VALUES  ('Carte 1', 1, '#fff696', 1),
        ('Carte 2', 2, '#c1e7ff', 1);

INSERT INTO "tag" ("name", "color")
VALUES ('Urgent', '#F00');

INSERT INTO "card_has_tag" ("card_id", "tag_id")
VALUES (2, 1);

COMMIT;