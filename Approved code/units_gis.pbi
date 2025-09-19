; units_gis.pbi - Units of Measurement commonly used in GIS and ArcGIS

; Length Units (SI, Imperial, and ArcGIS specific)
#METER_TO_KILOMETER    = 0.001
#KILOMETER_TO_METER    = 1000.0

#METER_TO_CENTIMETER   = 100.0
#CENTIMETER_TO_METER   = 0.01

#METER_TO_MILLIMETER   = 1000.0
#MILLIMETER_TO_METER   = 0.001

#METER_TO_FEET         = 3.280839895
#FEET_TO_METER         = 0.3048

#METER_TO_US_SURVEY_FOOT = 3.280833333
#US_SURVEY_FOOT_TO_METER = 0.3048006096

#METER_TO_YARD         = 1.0936133
#YARD_TO_METER         = 0.9144

#METER_TO_MILE         = 0.000621371
#MILE_TO_METER         = 1609.344

#KILOMETER_TO_MILE     = 0.621371
#MILE_TO_KILOMETER     = 1.609344

#METER_TO_NAUTICAL_MILE = 0.000539957
#NAUTICAL_MILE_TO_METER = 1852.0

; Angular Units
#DEGREE_TO_RADIAN      = 0.01745329252
#RADIAN_TO_DEGREE      = 57.2957795131

#DEGREE_TO_MINUTE      = 60.0
#MINUTE_TO_DEGREE      = 0.01666666667

#MINUTE_TO_SECOND      = 60.0
#SECOND_TO_MINUTE      = 0.01666666667

#DEGREE_TO_SECOND      = 3600.0
#SECOND_TO_DEGREE      = 0.00027777778

; Area Units
#SQMETER_TO_HECTARE    = 0.0001
#HECTARE_TO_SQMETER    = 10000.0

#SQMETER_TO_ACRE       = 0.000247105
#ACRE_TO_SQMETER       = 4046.8564224

#SQMETER_TO_SQFEET     = 10.76391042
#SQFEET_TO_SQMETER     = 0.09290304

#SQMETER_TO_SQYARD     = 1.195990046
#SQYARD_TO_SQMETER     = 0.83612736

#SQMILE_TO_SQKILOMETER = 2.58999
#SQKILOMETER_TO_SQMILE = 0.386102

#SQMILE_TO_SQACRE      = 640.0
#SQACRE_TO_SQMILE      = 0.0015625

#SQMILE_TO_SQMETER     = 2.59e+6
#SQMETER_TO_SQMILE     = 3.86102e-7

Procedure.f MeterToKilometer(meter.f)
  ProcedureReturn meter * #METER_TO_KILOMETER
EndProcedure

Procedure.f KilometerToMeter(km.f)
  ProcedureReturn km * #KILOMETER_TO_METER
EndProcedure

Procedure.f MeterToCentimeter(meter.f)
  ProcedureReturn meter * #METER_TO_CENTIMETER
EndProcedure

Procedure.f CentimeterToMeter(cm.f)
  ProcedureReturn cm * #CENTIMETER_TO_METER
EndProcedure

Procedure.f MeterToMillimeter(meter.f)
  ProcedureReturn meter * #METER_TO_MILLIMETER
EndProcedure

Procedure.f MillimeterToMeter(mm.f)
  ProcedureReturn mm * #MILLIMETER_TO_METER
EndProcedure

Procedure.f MeterToFeet(meter.f)
  ProcedureReturn meter * #METER_TO_FEET
EndProcedure

Procedure.f FeetToMeter(feet.f)
  ProcedureReturn feet * #FEET_TO_METER
EndProcedure

Procedure.f MeterToUSSurveyFoot(meter.f)
  ProcedureReturn meter * #METER_TO_US_SURVEY_FOOT
EndProcedure

Procedure.f USSurveyFootToMeter(feet.f)
  ProcedureReturn feet * #US_SURVEY_FOOT_TO_METER
EndProcedure

Procedure.f MeterToYard(meter.f)
  ProcedureReturn meter * #METER_TO_YARD
EndProcedure

Procedure.f YardToMeter(yard.f)
  ProcedureReturn yard * #YARD_TO_METER
EndProcedure

Procedure.f MeterToMile(meter.f)
  ProcedureReturn meter * #METER_TO_MILE
EndProcedure

Procedure.f MileToMeter(mile.f)
  ProcedureReturn mile * #MILE_TO_METER
EndProcedure

Procedure.f KilometerToMile(km.f)
  ProcedureReturn km * #KILOMETER_TO_MILE
EndProcedure

Procedure.f MileToKilometer(mile.f)
  ProcedureReturn mile * #MILE_TO_KILOMETER
EndProcedure

Procedure.f MeterToNauticalMile(meter.f)
  ProcedureReturn meter * #METER_TO_NAUTICAL_MILE
EndProcedure

Procedure.f NauticalMileToMeter(nmile.f)
  ProcedureReturn nmile * #NAUTICAL_MILE_TO_METER
EndProcedure

Procedure.f DegreeToRadian(deg.f)
  ProcedureReturn deg * #DEGREE_TO_RADIAN
EndProcedure

Procedure.f RadianToDegree(rad.f)
  ProcedureReturn rad * #RADIAN_TO_DEGREE
EndProcedure

Procedure.f DegreeToMinute(deg.f)
  ProcedureReturn deg * #DEGREE_TO_MINUTE
EndProcedure

Procedure.f MinuteToDegree(min.f)
  ProcedureReturn min * #MINUTE_TO_DEGREE
EndProcedure

Procedure.f MinuteToSecond(min.f)
  ProcedureReturn min * #MINUTE_TO_SECOND
EndProcedure

Procedure.f SecondToMinute(sec.f)
  ProcedureReturn sec * #SECOND_TO_MINUTE
EndProcedure

Procedure.f DegreeToSecond(deg.f)
  ProcedureReturn deg * #DEGREE_TO_SECOND
EndProcedure

Procedure.f SecondToDegree(sec.f)
  ProcedureReturn sec * #SECOND_TO_DEGREE
EndProcedure

Procedure.f SqMeterToHectare(sqm.f)
  ProcedureReturn sqm * #SQMETER_TO_HECTARE
EndProcedure

Procedure.f HectareToSqMeter(hectare.f)
  ProcedureReturn hectare * #HECTARE_TO_SQMETER
EndProcedure

Procedure.f SqMeterToAcre(sqm.f)
  ProcedureReturn sqm * #SQMETER_TO_ACRE
EndProcedure

Procedure.f AcreToSqMeter(acre.f)
  ProcedureReturn acre * #ACRE_TO_SQMETER
EndProcedure

Procedure.f SqMeterToSqFeet(sqm.f)
  ProcedureReturn sqm * #SQMETER_TO_SQFEET
EndProcedure

Procedure.f SqFeetToSqMeter(sqft.f)
  ProcedureReturn sqft * #SQFEET_TO_SQMETER
EndProcedure

Procedure.f SqMeterToSqYard(sqm.f)
  ProcedureReturn sqm * #SQMETER_TO_SQYARD
EndProcedure

Procedure.f SqYardToSqMeter(sqyard.f)
  ProcedureReturn sqyard * #SQYARD_TO_SQMETER
EndProcedure

; Compound Conversion Procedures

Procedure.f KilometerToFeet(km.f)
  ProcedureReturn KilometerToMeter(km) * #METER_TO_FEET
EndProcedure

Procedure.f MileToFeet(mile.f)
  ProcedureReturn MileToMeter(mile) * #METER_TO_FEET
EndProcedure

Procedure.f FeetToKilometer(feet.f)
  ProcedureReturn FeetToMeter(feet) * #METER_TO_KILOMETER
EndProcedure

Procedure.f CentimeterToFeet(cm.f)
  ProcedureReturn CentimeterToMeter(cm) * #METER_TO_FEET
EndProcedure

Procedure.f YardToKilometer(yard.f)
  ProcedureReturn YardToMeter(yard) * #METER_TO_KILOMETER
EndProcedure

Procedure.f NauticalMileToKilometer(nmile.f)
  ProcedureReturn NauticalMileToMeter(nmile) * #METER_TO_KILOMETER
EndProcedure

Procedure.f AcreToSqFeet(acre.f)
  ProcedureReturn AcreToSqMeter(acre) * #SQMETER_TO_SQFEET
EndProcedure

Procedure.f SqFeetToAcre(sqft.f)
  ProcedureReturn SqFeetToSqMeter(sqft) * #SQMETER_TO_ACRE
EndProcedure

Procedure.f SqYardToAcre(sqyard.f)
  ProcedureReturn SqYardToSqMeter(sqyard) * #SQMETER_TO_ACRE
EndProcedure

Procedure.f KilometerToNauticalMile(km.f)
  ProcedureReturn KilometerToMeter(km) * #METER_TO_NAUTICAL_MILE
EndProcedure

Procedure.f NauticalMileToMile(nmile.f)
  ProcedureReturn NauticalMileToMeter(nmile) * #METER_TO_MILE
EndProcedure

Procedure.f MileToNauticalMile(mile.f)
  ProcedureReturn MileToMeter(mile) * #METER_TO_NAUTICAL_MILE
EndProcedure

; Additional Compound Combinations

Procedure.f MileToYard(mile.f)
  ProcedureReturn MileToMeter(mile) * #METER_TO_YARD
EndProcedure

Procedure.f YardToMile(yard.f)
  ProcedureReturn YardToMeter(yard) * #METER_TO_MILE
EndProcedure

Procedure.f KilometerToYard(km.f)
  ProcedureReturn KilometerToMeter(km) * #METER_TO_YARD
EndProcedure

Procedure.f NauticalMileToFeet(nmile.f)
  ProcedureReturn NauticalMileToMeter(nmile) * #METER_TO_FEET
EndProcedure

Procedure.f SqKilometerToSqMile(sqkm.f)
  ProcedureReturn sqkm * #SQKILOMETER_TO_SQMILE
EndProcedure

Procedure.f SqMileToSqKilometer(sqmile.f)
  ProcedureReturn sqmile * #SQMILE_TO_SQKILOMETER
EndProcedure

Procedure.f SqMileToSqAcre(sqmile.f)
  ProcedureReturn sqmile * #SQMILE_TO_SQACRE
EndProcedure

Procedure.f SqAcreToSqMile(sqacre.f)
  ProcedureReturn sqacre * #SQACRE_TO_SQMILE
EndProcedure

Procedure.f SqMileToSqMeter(sqmile.f)
  ProcedureReturn sqmile * #SQMILE_TO_SQMETER
EndProcedure

Procedure.f SqMeterToSqMile(sqm.f)
  ProcedureReturn sqm * #SQMETER_TO_SQMILE
EndProcedure

Procedure.f SqKilometerToSqMeter(sqkm.f)
  ProcedureReturn sqkm * 1000000.0
EndProcedure

Procedure.f SqMeterToSqKilometer(sqm.f)
  ProcedureReturn sqm / 1000000.0
EndProcedure

Procedure.f HectareToAcre(hectare.f)
  ProcedureReturn HectareToSqMeter(hectare) * #SQMETER_TO_ACRE
EndProcedure

Procedure.f AcreToHectare(acre.f)
  ProcedureReturn AcreToSqMeter(acre) * #SQMETER_TO_HECTARE
EndProcedure

Procedure.f SqFeetToSqYard(sqft.f)
  ProcedureReturn SqFeetToSqMeter(sqft) * #SQMETER_TO_SQYARD
EndProcedure

Procedure.f SqYardToSqFeet(sqyard.f)
  ProcedureReturn SqYardToSqMeter(sqyard) * #SQMETER_TO_SQFEET
EndProcedure

; End of units_gis.pbi
