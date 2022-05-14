CREATE TABLE "gears" (
  "gearId" SERIAL PRIMARY KEY NOT NULL,
  "armorId" integer,
  "weaponId" integer,
  "nickname" text NOT NULL,
  "availableSlots" integer NOT NULL DEFAULT 5
);

CREATE TABLE "gearAugments" (
  "gearId" integer NOT NULL,
  "augmentId" integer NOT NULL
);

CREATE TABLE "augments" (
  "augmentId" SERIAL PRIMARY KEY NOT NULL,
  "slotId" integer,
  "name" text NOT NULL
);

CREATE TABLE "augmentEffects" (
  "augmentId" integer NOT NULL,
  "effectId" integer NOT NULL,
  "name" text NOT NULL,
  "value" decimal NOT NULL
);

CREATE TABLE "effectTypes" (
  "effectId" SERIAL PRIMARY KEY NOT NULL,
  "elementId" integer,
  "attackTypeId" integer,
  "unitOfValue" text NOT NULL
);

CREATE TABLE "slots" (
  "slotId" SERIAL PRIMARY KEY NOT NULL,
  "name" text NOT NULL
);

CREATE TABLE "attackTypes" (
  "attackTypeId" SERIAL PRIMARY KEY NOT NULL,
  "name" text NOT NULL
);

CREATE TABLE "elements" (
  "elementId" SERIAL PRIMARY KEY NOT NULL,
  "name" text NOT NULL
);

CREATE TABLE "weaponTypes" (
  "weaponTypeId" SERIAL PRIMARY KEY NOT NULL,
  "attackTypeId" integer NOT NULL
);

CREATE TABLE "weapons" (
  "weaponId" SERIAL PRIMARY KEY NOT NULL,
  "weaponTypeId" integer NOT NULL,
  "elementId" integer,
  "seriesId" integer NOT NULL,
  "name" text NOT NULL,
  "bpAtLVL0" decimal NOT NULL,
  "bpAtLVL50" decimal NOT NULL,
  "attack" integer NOT NULL,
  "minPotencyPercent" decimal NOT NULL
);

CREATE TABLE "armor" (
  "armorId" SERIAL PRIMARY KEY,
  "name" text NOT NULL,
  "rarity" integer NOT NULL,
  "bpAtLVL0" decimal NOT NULL,
  "bpAtLVL50" decimal NOT NULL,
  "defense" integer NOT NULL,
  "HP" integer,
  "PP" integer,
  "meleePotency" decimal,
  "rangedPotency" decimal,
  "techniquePotency" decimal,
  "ailmentResistPercent" decimal
);

CREATE TABLE "weaponSeries" (
  "seriesId" SERIAL PRIMARY KEY NOT NULL,
  "name" string NOT NULL,
  "rarity" integer NOT NULL
);

ALTER TABLE "gears" ADD FOREIGN KEY ("armorId") REFERENCES "armor" ("armorId");

ALTER TABLE "gears" ADD FOREIGN KEY ("weaponId") REFERENCES "weapons" ("weaponId");

ALTER TABLE "gearAugments" ADD FOREIGN KEY ("gearId") REFERENCES "gears" ("gearId");

ALTER TABLE "gearAugments" ADD FOREIGN KEY ("augmentId") REFERENCES "augments" ("augmentId");

ALTER TABLE "augments" ADD FOREIGN KEY ("slotId") REFERENCES "slots" ("slotId");

ALTER TABLE "augmentEffects" ADD FOREIGN KEY ("augmentId") REFERENCES "augments" ("augmentId");

ALTER TABLE "augmentEffects" ADD FOREIGN KEY ("effectId") REFERENCES "effectTypes" ("effectId");

ALTER TABLE "effectTypes" ADD FOREIGN KEY ("elementId") REFERENCES "elements" ("elementId");

ALTER TABLE "effectTypes" ADD FOREIGN KEY ("attackTypeId") REFERENCES "attackTypes" ("attackTypeId");

ALTER TABLE "weaponTypes" ADD FOREIGN KEY ("attackTypeId") REFERENCES "attackTypes" ("attackTypeId");

ALTER TABLE "weapons" ADD FOREIGN KEY ("weaponTypeId") REFERENCES "weaponTypes" ("weaponTypeId");

ALTER TABLE "weapons" ADD FOREIGN KEY ("elementId") REFERENCES "elements" ("elementId");

ALTER TABLE "weapons" ADD FOREIGN KEY ("seriesId") REFERENCES "weaponSeries" ("seriesId");
