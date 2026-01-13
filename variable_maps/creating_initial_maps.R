library(readr)
library(tibble)
library(dplyr)


################################################################################################
################################################################################################
#### Population ----
pop_ref_data <- tribble(
  ~label,                          ~variable,       ~stat_type,  ~denominator,    ~category,
  
  # --- BASIC COUNTS ---
  "Total Population",              "B01003_001",    "number",     NA,             "Population",
  "Median Age",                    "B01002_001",    "number",    NA,              "Population",
  
  # --- RACE (B02001 Series - Includes Hispanic/Latino) ---
  # Note: These columns will NOT sum to 100% if Hispanic is also analyzed separately, 
  # as Hispanic individuals are included in these race counts.
  "White Alone",                   "B02001_002",    "count",     "B01003_001",    "Population",
  "Black Alone",                   "B02001_003",    "count",     "B01003_001",    "Population",
  "Native American Alone",         "B02001_004",    "count",     "B01003_001",    "Population",
  "Asian Alone",                   "B02001_005",    "count",     "B01003_001",    "Population",
  "Pacific Islander Alone",        "B02001_006",    "count",     "B01003_001",    "Population",
  "Some Other Race Alone",         "B02001_007",    "count",     "B01003_001",    "Population",
  
  # --- TWO OR MORE RACES BREAKDOWN ---
  "Two or More Races (Total)",     "B02001_008",    "count",     "B01003_001",    "Population",
  "Two+ Races (Incl. Other)",      "B02001_009",    "count",     "B01003_001",    "Population",
  "Two+ Races (Excl. Other)",      "B02001_010",    "count",     "B01003_001",    "Population",
  
  # --- ETHNICITY (Overlapping) ---
  "Hispanic (Any Race)",           "B03003_003",    "count",     "B01003_001",    "Population",
  
  # --- ALL AGE GROUPS ---
  "Pop Under 5 Years",   "S0101_C01_002", "count",    "S0101_C01_001", "Population",
  "Pop 5 to 9 Years",    "S0101_C01_003", "count",    "S0101_C01_001", "Population", 
  "Pop 10 to 14 Years",  "S0101_C01_004", "count",    "S0101_C01_001", "Population", 
  "Pop 15 to 19 Years",  "S0101_C01_005", "count",    "S0101_C01_001", "Population", 
  "Pop 20 to 24 Years",  "S0101_C01_006", "count",    "S0101_C01_001", "Population",
  "Pop 25 to 29 Years",  "S0101_C01_007", "count",    "S0101_C01_001", "Population",
  "Pop 30 to 34 Years",  "S0101_C01_008", "count",    "S0101_C01_001", "Population",
  "Pop 35 to 39 Years",  "S0101_C01_009", "count",    "S0101_C01_001", "Population",
  "Pop 40 to 44 Years",  "S0101_C01_010", "count",    "S0101_C01_001", "Population",
  "Pop 45 to 49 Years",  "S0101_C01_011", "count",    "S0101_C01_001", "Population",
  "Pop 50 to 54 Years",  "S0101_C01_012", "count",    "S0101_C01_001", "Population",
  "Pop 55 to 59 Years",  "S0101_C01_013", "count",    "S0101_C01_001", "Population",
  "Pop 60 to 64 Years",  "S0101_C01_014", "count",    "S0101_C01_001", "Population",
  "Pop 65 to 69 Years",  "S0101_C01_015", "count",    "S0101_C01_001", "Population",
  "Pop 70 to 74 Years",  "S0101_C01_016", "count",    "S0101_C01_001", "Population",
  "Pop 75 to 79 Years",  "S0101_C01_017", "count",    "S0101_C01_001", "Population",
  "Pop 80 to 84 Years",  "S0101_C01_018", "count",    "S0101_C01_001", "Population",
  "Pop 85 Years and Over","S0101_C01_019","count",    "S0101_C01_001", "Population",
  
  # --- SUMMARY AGE GROUPS ---
  "Pop Under 18 Years",            "S0101_C01_022", "count",     "S0101_C01_001", "Population",
  "Pop 65 Years and Over",         "S0101_C01_030", "count",     "S0101_C01_001", "Population",  

  # --- AGE DEPENDENCY  ---
  "Age dependency ratio",          "S0101_C01_034", "ratio",     NA,              "Population", 
  "Old-age dependency ratio",      "S0101_C01_035", "ratio",     NA,              "Population", 
  "Child dependency ratio",        "S0101_C01_036", "ratio",     NA,              "Population",  
  
  "Age dependency ratio (2013)",      "S0101_C01_032", "ratio",     NA,              "Population", 
  "Old-age dependency ratio (2013)",  "S0101_C01_033", "ratio",     NA,              "Population", 
  "Child dependency ratio (2013)",    "S0101_C01_034", "ratio",     NA,              "Population",  
  
  # --- VETERANS ---
  "Total Veterans",                "B21001_002",    "count",     "B21001_001",    "Population", 
  
  # --- FOREIGN BORN ---
  "Foreign Born",                  "B05002_013",    "count",     "B01003_001",    "Population",
  
  # --- DENOMINATORS ---
  "Total Pop (Denom)",             "B01003_001",    "denom",     NA,              "Population",
  "Total Pop (Age Denom)",         "S0101_C01_001", "denom",     NA,              "Population",
  "Total Civ Pop 18+ (Vet Denom)", "B21001_001",    "denom",     NA,              "Population"
)



################################################################################################
################################################################################################
#### Housing ----

housing_ref_data <- tribble(
  ~label,                          ~variable,       ~stat_type,  ~denominator,    ~category,
  
  # --- OCCUPANCY ---
  "Total Housing Units",           "B25002_001",    "number",     NA,              "Housing",
  "Occupied Units",                "B25002_002",    "count",     "B25002_001",    "Housing",
  "Vacant Units",                  "B25002_003",    "count",     "B25002_001",    "Housing",
  "Owner Occupied Units",          "B25106_002",    "count",     "B25002_001",    "Housing",
  "Renter Occupied Units",         "B25106_024",    "count",     "B25002_001",    "Housing",
  
  # --- COSTS  ---
  "Median Home Value",             "B25077_001",    "currency",  NA,              "Housing",
  "Median Gross Rent",             "B25064_001",    "currency",  NA,              "Housing",
  
  # --- COST BURDEN  ---
  "Severe Rent Burden (>50%)",     "B25070_010",    "count",     "B25070_001",    "Housing",
  "Severe Owner Burden (>50%)",    "B25091_021",    "count",     "B25091_001",    "Housing",
  
  # --- STRUCTURE ---
  # ---Single Family ---
  "Single Family (Detached)",      "B25024_002",   "count",   "B25024_001",  "Housing",
  "Single Family (Attached)",      "B25024_003",   "count",   "B25024_001",  "Housing", 
  
  # --- Multi-Family---
  "Multi-Family (2 Units)",        "B25024_004",   "count",   "B25024_001",  "Housing", 
  "Multi-Family (3-4 Units)",      "B25024_005",   "count",   "B25024_001",  "Housing",
  "Multi-Family (5-9 Units)",      "B25024_006",   "count",   "B25024_001",  "Housing", 
  "Multi-Family (10-19 Units)",    "B25024_007",   "count",   "B25024_001",  "Housing",
  "Multi-Family (20-49 Units)",    "B25024_008",   "count",   "B25024_001",  "Housing",
  "Multi-Family (50+ Units)",      "B25024_009",   "count",   "B25024_001",  "Housing", 
  
  # --- Non-Traditional ---
  "Mobile Homes",                  "B25024_010",   "count",   "B25024_001",  "Housing",
  "Boat, RV, Van, etc.",           "B25024_011",   "count",   "B25024_001",  "Housing",
  
  # --- AGE OF HOUSING ---
  "Median Year Built",             "B25035_001",    "year",    NA,              "Housing",

  
  # --- HEATING  ---
  "Heating: Utility Gas",          "B25040_002",    "count",     "B25040_001",    "Housing",
  "Heating: Bottled/LP Gas",       "B25040_003",    "count",     "B25040_001",    "Housing",
  "Heating: Electricity",          "B25040_004",    "count",     "B25040_001",    "Housing",
  "Heating: Wood",                 "B25040_006",    "count",     "B25040_001",    "Housing",
  
  # --- BURDEN BY INCOME  ---
  "Owners <$20k (>30%)",          "B25106_006",   "count",      "B25106_003",    "Housing",
  "Owners $20k-$34,999k (>30%)",  "B25106_010",   "count",      "B25106_007",    "Housing",
  "Owners $35k-$49,999k (>30%)",  "B25106_014",   "count",      "B25106_011",    "Housing",
  "Owners $50k-$74,999k (>30%)",  "B25106_018",   "count",      "B25106_015",    "Housing",
  "Owners $75K or More (>30%)",   "B25106_022",   "count",      "B25106_019",    "Housing",
  
  "Renters <$20k (>30%)",          "B25106_028",   "count",      "B25106_025",    "Housing",
  "Renters $20k-$34,999k (>30%)",  "B25106_032",   "count",      "B25106_029",    "Housing",
  "Renters $35k-$49,999k (>30%)",  "B25106_036",   "count",      "B25106_033",    "Housing",
  "Renters $50k-$74,999k (>30%)",  "B25106_040",   "count",      "B25106_037",    "Housing",
  "Renters $75K or More (>30%)",   "B25106_044",   "count",      "B25106_041",    "Housing",
  
  
  # --- DENOMINATORS ---
  "Total Housing Units (Denom)",   "B25002_001",    "denom",     NA,              "Housing",
  "Renters (Burden Denom)",        "B25070_001",    "denom",     NA,              "Housing",
  "Owners (Burden Denom)",         "B25091_001",    "denom",     NA,              "Housing",
  "Structure Denom",               "B25024_001",    "denom",     NA,              "Housing",
  "Heating Denom",                 "B25040_001",    "denom",     NA,              "Housing",
  
  "Owners <$20k Denom",            "B25106_003",    "denom",     NA,              "Housing",
  "Owners $20k-$34,999k Denom",    "B25106_007",    "denom",     NA,              "Housing",
  "Owners $35k-$49,999k Denom",    "B25106_011",    "denom",     NA,              "Housing",
  "Owners $50k-$74,999k Denom",    "B25106_015",    "denom",     NA,              "Housing",
  "Owners $75K or More Denom",     "B25106_019",    "denom",     NA,              "Housing",
  
  "Renters <$20k Denom",            "B25106_025",    "denom",     NA,              "Housing",
  "Renters $20k-$34,999k Denom",    "B25106_029",    "denom",     NA,              "Housing",
  "Renters $25k-$49,999k Denom",    "B25106_033",    "denom",     NA,              "Housing",
  "Renters $50k-$74,999k Denom",    "B25106_037",    "denom",     NA,              "Housing",
  "Renters $75K or More Denom",     "B25106_041",    "denom",     NA,              "Housing",
  
)


################################################################################################
################################################################################################
#### Income ----

income_ref_data <- tribble(
  ~label,                          ~variable,       ~stat_type,  ~denominator,    ~category,
  
  # --- KEY METRICS ---
  "Median Household Income",       "B19013_001",    "currency",  NA,              "Income",
  "Per Capita Income",             "B19301_001",    "currency",  NA,              "Income",
  
  # --- POVERTY METRICS ---
  "Total People in Poverty",       "B17001_002",    "count",     "B17001_001",    "Income",
  "Children (0-17) in Poverty",    "B17001_004",    "count",     "B17001_001",    "Income",
  "Deep Poverty (<50% FPL)",       "C17002_002",    "count",     "C17002_001",    "Income",
  "Poverty Rate: Overall",         "S1701_C03_001", "percent",   NA,              "Income",
  "Poverty Rate: Under 18",        "S1701_C03_002", "percent",   NA,              "Income",
  "Poverty Rate: Seniors (65+)",   "S1701_C03_010", "percent",   NA,              "Income",
  
  # --- FULL INCOME BRACKETS (B19001) ---
  # Denom is B19001_001 (Total Households) for all of these
  "Income <$10k",                  "B19001_002",    "count",     "B19001_001",    "Income",
  "Income $10k-$14,999",           "B19001_003",    "count",     "B19001_001",    "Income",
  "Income $15k-$19,999",           "B19001_004",    "count",     "B19001_001",    "Income",
  "Income $20k-$24,999",           "B19001_005",    "count",     "B19001_001",    "Income",
  "Income $25k-$29,999",           "B19001_006",    "count",     "B19001_001",    "Income",
  "Income $30k-$34,999",           "B19001_007",    "count",     "B19001_001",    "Income",
  "Income $35k-$39,999",           "B19001_008",    "count",     "B19001_001",    "Income",
  "Income $40k-$44,999",           "B19001_009",    "count",     "B19001_001",    "Income",
  "Income $45k-$49,999",           "B19001_010",    "count",     "B19001_001",    "Income",
  "Income $50k-$59,999",           "B19001_011",    "count",     "B19001_001",    "Income",
  "Income $60k-$74,999",           "B19001_012",    "count",     "B19001_001",    "Income",
  "Income $75k-$99,999",           "B19001_013",    "count",     "B19001_001",    "Income",
  "Income $100k-$124,999",         "B19001_014",    "count",     "B19001_001",    "Income",
  "Income $125k-$149,999",         "B19001_015",    "count",     "B19001_001",    "Income",
  "Income $150k-$199,999",         "B19001_016",    "count",     "B19001_001",    "Income",
  "Income $200k+",                 "B19001_017",    "count",     "B19001_001",    "Income",
  
  # --- DENOMINATORS ---
  "Total Households (Denom)",      "B19001_001",    "denom",     NA,              "Income",
  "Poverty Universe (Denom)",      "B17001_001",    "denom",     NA,              "Income",
  "Poverty Universe Ratio (Denom)","C17002_001",    "denom",     NA,              "Income"
)



################################################################################################
################################################################################################
#### Education ----

education_ref_data <- tribble(
  ~label,                                    ~variable,    ~stat_type, ~denominator,  ~category,
  
  # --- SCHOOL ENROLLMENT (Pop 3+) [B14001] ---
  "Total Enrolled in School",                "B14001_002", "count",    "B14001_001",  "Education",
  "Total Not Enrolled in School",            "B14001_010", "count",    "B14001_001",  "Education",
  
  "Enrolled in Nursery/Preschool",           "B14001_003", "count",    "B14001_001",  "Education",
  "Enrolled in Kindergarten",                "B14001_004", "count",    "B14001_001",  "Education",
  "Enrolled in Grade 1 to 4",                "B14001_005", "count",    "B14001_001",  "Education",
  "Enrolled in Grade 5 to 8",                "B14001_006", "count",    "B14001_001",  "Education",
  "Enrolled in Grade 9 to 12",               "B14001_007", "count",    "B14001_001",  "Education",
  "Enrolled in College (Undergrad)",         "B14001_008", "count",    "B14001_001",  "Education",
  "Enrolled in Grad/Professional School",    "B14001_009", "count",    "B14001_001",  "Education",
  
  
  # --- EDUCATIONAL ATTAINMENT (Pop 25+) [B15003] ---
  # 1. Less than 9th Grade Components (002 - 012)
  "No schooling completed",                  "B15003_002", "count",    "B15003_001",  "Education",
  "Nursery school",                          "B15003_003", "count",    "B15003_001",  "Education",
  "Kindergarten",                            "B15003_004", "count",    "B15003_001",  "Education",
  "1st grade",                               "B15003_005", "count",    "B15003_001",  "Education",
  "2nd grade",                               "B15003_006", "count",    "B15003_001",  "Education",
  "3rd grade",                               "B15003_007", "count",    "B15003_001",  "Education",
  "4th grade",                               "B15003_008", "count",    "B15003_001",  "Education",
  "5th grade",                               "B15003_009", "count",    "B15003_001",  "Education",
  "6th grade",                               "B15003_010", "count",    "B15003_001",  "Education",
  "7th grade",                               "B15003_011", "count",    "B15003_001",  "Education",
  "8th grade",                               "B15003_012", "count",    "B15003_001",  "Education",
  
  # 2. 9th to 12th Grade, No Diploma Components (013 - 016)
  "9th grade",                               "B15003_013", "count",    "B15003_001",  "Education",
  "10th grade",                              "B15003_014", "count",    "B15003_001",  "Education",
  "11th grade",                              "B15003_015", "count",    "B15003_001",  "Education",
  "12th grade, no diploma",                  "B15003_016", "count",    "B15003_001",  "Education",
  
  # 3. High School Graduate (017 - 018)
  "Regular high school diploma",             "B15003_017", "count",    "B15003_001",  "Education",
  "GED or alternative credential",           "B15003_018", "count",    "B15003_001",  "Education",
  
  # 4. Some College (019 - 020)
  "Some college, less than 1 year",          "B15003_019", "count",    "B15003_001",  "Education",
  "Some college, 1 or more years, no degree","B15003_020", "count",    "B15003_001",  "Education",
  
  # 5. Degrees (021 - 025)
  "Associate's degree",                      "B15003_021", "count",    "B15003_001",  "Education",
  "Bachelor's degree",                       "B15003_022", "count",    "B15003_001",  "Education",
  "Master's degree",                         "B15003_023", "count",    "B15003_001",  "Education",
  "Professional school degree",              "B15003_024", "count",    "B15003_001",  "Education",
  "Doctorate degree",                        "B15003_025", "count",    "B15003_001",  "Education",
  
  # --- DENOMINATORS ---
  "Total Pop 3+ (Enrollment)",               "B14001_001", "denom",    NA,            "Education",
  "Total Pop 25+ (Attainment)",              "B15003_001", "denom",    NA,            "Education"
)



################################################################################################
################################################################################################
#### Employment ----
##-note: consider adding / expanding upon this census data to include: 
###--LODES (LEHD Origin-Destination Employment Statistics): "Where do people work vs live?" on a granular level. Package: lehdr
###--Business Data (CBP): Endpoint: The Census API has cbp


employment_ref_data <- tribble(
  ~label,                          ~variable,       ~stat_type,  ~denominator,    ~category,
  
  # --- LABOR FORCE STATUS (DP03) ---
  "In Labor Force",                "DP03_0002",     "count",     "DP03_0001",     "Employment",
  "Civilian Labor Force",          "DP03_0003",     "count",     "DP03_0001",     "Employment",
  "Employed (Civilian)",           "DP03_0004",     "count",     "DP03_0001",     "Employment",
  
  # --- UNEMPLOYMENT (DP03) ---
  "Unemployed (Civilian)",         "DP03_0005",     "count",     "DP03_0003",     "Employment",
  
  # --- NOT IN LABOR FORCE (DP03) ---
  "Not in Labor Force",            "DP03_0007",     "count",     "DP03_0001",     "Employment",
  
  # --- CLASS OF WORKER (DP03) ---
  # Universe: Civilian employed population 16 years and over
  "Private Wage & Salary Workers", "DP03_0047",     "count",     "DP03_0004",     "Employment",
  "Government Workers",            "DP03_0048",     "count",     "DP03_0004",     "Employment",
  "Self-Employed (Unincorporated)","DP03_0049",     "count",     "DP03_0004",     "Employment",
  "Unpaid Family Workers",         "DP03_0050",     "count",     "DP03_0004",     "Employment",
  
  # --- OCCUPATION (DP03) ---
  # Universe: Civilian employed population 16 years and over
  "Mgmt, Business, Science, Arts", "DP03_0027",     "count",     "DP03_0004",     "Employment", 
  "Service Occupations",           "DP03_0028",     "count",     "DP03_0004",     "Employment",
  "Sales & Office Occupations",    "DP03_0029",     "count",     "DP03_0004",     "Employment",
  "Nat Resources, Const, Maint",   "DP03_0030",     "count",     "DP03_0004",     "Employment",
  "Production, Transpo, Moving",   "DP03_0031",     "count",     "DP03_0004",     "Employment",
  
  # --- INDUSTRY (DP03) ---
  # Universe: Civilian employed population 16 years and over
  "Ag, Forestry, Fishing, Mining", "DP03_0033",     "count",     "DP03_0004",     "Employment",
  "Construction",                  "DP03_0034",     "count",     "DP03_0004",     "Employment",
  "Manufacturing",                 "DP03_0035",     "count",     "DP03_0004",     "Employment",
  "Wholesale Trade",               "DP03_0036",     "count",     "DP03_0004",     "Employment",
  "Retail Trade",                  "DP03_0037",     "count",     "DP03_0004",     "Employment",
  "Transpo, Warehousing, Utils",   "DP03_0038",     "count",     "DP03_0004",     "Employment",
  "Information",                   "DP03_0039",     "count",     "DP03_0004",     "Employment",
  "Finance, Insurance, Real Est",  "DP03_0040",     "count",     "DP03_0004",     "Employment",
  "Prof, Scientific, Mgmt, Admin", "DP03_0041",     "count",     "DP03_0004",     "Employment",
  "Edu, Health, Social Assist",    "DP03_0042",     "count",     "DP03_0004",     "Employment",
  "Arts, Ent, Rec, Food Svcs",     "DP03_0043",     "count",     "DP03_0004",     "Employment",
  "Other Services (Public Admin)", "DP03_0044",     "count",     "DP03_0004",     "Employment",
  "Public Administration",         "DP03_0045",     "count",     "DP03_0004",     "Employment",
  
  # --- EARNINGS (DP03) ---
  # Confirmed: These are Median Earnings for Workers (Inflation Adjusted)
  "Median Earnings (Workers)",        "DP03_0092",     "currency",  NA,           "Employment", 
  "Median Earnings (Male Full-Time)", "DP03_0093",  "currency",  NA,              "Employment",
  "Median Earnings (Fem Full-Time)",  "DP03_0094",  "currency",  NA,              "Employment",
  
  # --- COMMUTING MODES (DP03) ---
  "Drove Alone",                   "DP03_0019",     "count",     "DP03_0018",     "Employment",
  "Carpooled",                     "DP03_0020",     "count",     "DP03_0018",     "Employment",
  "Public Transit",                "DP03_0021",     "count",     "DP03_0018",     "Employment",
  "Walked to Work",                "DP03_0022",     "count",     "DP03_0018",     "Employment",
  "Work from Home",                "DP03_0024",     "count",     "DP03_0018",     "Employment",
  "Mean Commute Time (Min)",       "DP03_0025",     "number",    NA,              "Employment",
  
  # --- WORK LOCATIONS (B08007) ---
  "Worked in County of Residence", "B08007_003",    "count",     "B08007_001",    "Employment",
  "Worked Outside County",         "B08007_004",    "count",     "B08007_001",    "Employment",
  
  # --- DENOMINATORS ---
  "Total Pop 16+ (Labor Market)",  "DP03_0001",     "denom",     NA,              "Employment",
  "Civilian Labor Force (Denom)",  "DP03_0003",     "denom",     NA,              "Employment",
  "Employed 16+ (Ind/Occ Denom)",  "DP03_0004",     "denom",     NA,              "Employment",
  "Workers 16+ (Commute Denom)",   "DP03_0018",     "denom",     NA,              "Employment",
  "Workers 16+ (Location Denom)",  "B08007_001",    "denom",     NA,              "Employment"
)




################################################################################################
################################################################################################
#### Health (insurance and disability status) ----
# ---- FINAL BULLETPROOF HEALTH MAP (S & B Tables) ---- #
health_ref_data <- tribble(
  ~label,                          ~variable,       ~stat_type,  ~denominator,    ~category,
  
  # --- HEALTH INSURANCE  ---
  "Uninsured Population",          "S2701_C05_001", "count",     "S2701_C01_001", "Health",
  "Uninsured Rate (%)",            "S2701_C05_001", "percent",   NA,              "Health", 
  "With Private Insurance",        "S2701_C02_001", "count",     "S2701_C01_001", "Health",
  "With Public Insurance",         "S2701_C03_001", "count",     "S2701_C01_001", "Health",
  
  # --- DISABILITY ---
  "Total With Disability",         "S1810_C02_001", "count",     "S1810_C01_001", "Health",
  "Disability Rate (%)",           "S1810_C03_001", "percent",   NA,              "Health",
  
  "Under 18 w/ Disability",        "S1810_C02_002", "count",     "S1810_C01_002", "Health",
  "Seniors (65+) w/ Disability",   "S1810_C02_014", "count",     "S1810_C01_014", "Health",
  
  # --- BIRTHS ---
  "Births in Past 12 Months",      "B13002_002",    "count",     "B13002_001",    "Health",
  
  # --- DENOMINATORS ---
  "Total Civ Noninst Pop (Ins)",   "S2701_C01_001", "denom",     NA,              "Health",
  "Total Civ Noninst Pop (Dis)",   "S1810_C01_001", "denom",     NA,              "Health",
  "Pop Under 18 (Dis Denom)",      "S1810_C01_002", "denom",     NA,              "Health",
  "Seniors 65+ (Dis Denom)",       "S1810_C01_014", "denom",     NA,              "Health",
  "Women 15-50 (Births Denom)",    "B13002_001",    "denom",     NA,              "Health"
)



################################################################################################
################################################################################################
#--- save mapped variables

write_csv(pop_ref_data, here("variable_maps/population_vars_map.csv"))

write_csv(housing_ref_data, here("variable_maps/housing_vars_map.csv"))

write_csv(income_ref_data, here("variable_maps/income_vars_map.csv"))

write_csv(education_ref_data, here("variable_maps/education_vars_map.csv"))

write_csv(employment_ref_data, here("variable_maps/employment_vars_map.csv"))

write_csv(health_ref_data, here("variable_maps/health_vars_map.csv"))


