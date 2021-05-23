-- CreateTable
CREATE TABLE "Areas" (
    "id" BIGSERIAL NOT NULL,
    "pincode" BIGINT NOT NULL,
    "areaName" TEXT NOT NULL,
    "areaType" TEXT NOT NULL,
    "stateCode" BIGINT NOT NULL,
    "districtCode" BIGINT NOT NULL,
    "cityCode" BIGINT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cities" (
    "id" BIGSERIAL NOT NULL,
    "cityCode" BIGINT NOT NULL,
    "cityName" TEXT,
    "stateCode" BIGINT,
    "districtCode" BIGINT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Districts" (
    "id" BIGSERIAL NOT NULL,
    "districtCode" BIGINT NOT NULL,
    "districtName" TEXT,
    "stateCode" BIGINT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Hospitals" (
    "id" BIGSERIAL NOT NULL,
    "hospitalCode" BIGINT NOT NULL,
    "hospitalName" TEXT NOT NULL,
    "stateCode" BIGINT NOT NULL,
    "districtCode" BIGINT NOT NULL,
    "pincode" BIGINT NOT NULL,
    "hospitalDoctorsCount" BIGINT,
    "hospitalTotalBeds" BIGINT,
    "hospitalICUBeds" BIGINT,
    "hospitalNormalBeds" BIGINT,
    "hospitalAddress" TEXT,
    "hospitalLatitude" DECIMAL(11,7),
    "hospitalLongitude" DECIMAL(11,7),
    "hospitalCategory" TEXT,
    "hospitalCareType" TEXT,
    "hospitalMedicineDiscipline" TEXT,
    "hospitalTelephone" TEXT,
    "hospitalMobileNumber" TEXT,
    "hospitalEmergencyNumber" TEXT,
    "hospitalAmbulancePhoneNumber" TEXT,
    "hospitalBloodbankPhoneNumber" TEXT,
    "hospitalTollfree" TEXT,
    "hospitalHelpline" TEXT,
    "hospitalFax" TEXT,
    "hospitalPrimaryEmailID" TEXT,
    "hospitalSecondaryEmailID" TEXT,
    "hospitalWebsite" TEXT,
    "hospitalSpecialties" TEXT,
    "hospitalFacilities" TEXT,
    "cityCode" BIGINT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "States" (
    "id" BIGSERIAL NOT NULL,
    "stateCode" BIGINT NOT NULL,
    "stateName" TEXT,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "unq_pincode_area_name" ON "Areas"("pincode", "areaName");

-- CreateIndex
CREATE UNIQUE INDEX "Cities.cityCode_unique" ON "Cities"("cityCode");

-- CreateIndex
CREATE UNIQUE INDEX "Districts.districtCode_unique" ON "Districts"("districtCode");

-- CreateIndex
CREATE UNIQUE INDEX "States.stateCode_unique" ON "States"("stateCode");

-- AddForeignKey
ALTER TABLE "Hospitals" ADD FOREIGN KEY ("cityCode") REFERENCES "Cities"("cityCode") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hospitals" ADD FOREIGN KEY ("districtCode") REFERENCES "Districts"("districtCode") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hospitals" ADD FOREIGN KEY ("stateCode") REFERENCES "States"("stateCode") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Areas" ADD FOREIGN KEY ("cityCode") REFERENCES "Cities"("cityCode") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Areas" ADD FOREIGN KEY ("districtCode") REFERENCES "Districts"("districtCode") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Areas" ADD FOREIGN KEY ("stateCode") REFERENCES "States"("stateCode") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Districts" ADD FOREIGN KEY ("stateCode") REFERENCES "States"("stateCode") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cities" ADD FOREIGN KEY ("districtCode") REFERENCES "Districts"("districtCode") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cities" ADD FOREIGN KEY ("stateCode") REFERENCES "States"("stateCode") ON DELETE SET NULL ON UPDATE CASCADE;
