
housing_definitions <- tribble(
  ~variable,       ~var_definition,
  
  # --- OCCUPANCY ---
  "B25002_001",    "Total count of all housing units (occupied + vacant).",
  "B25002_002",    "Housing units currently inhabited by a household.",
  "B25002_003",    "Housing units not currently inhabited.",
  "B25106_002",    "Occupied units where the owner lives in the unit.",
  "B25106_024",    "Occupied units where the resident rents the unit.",
  
  # --- COSTS ---
  "B25077_001",    "Median value of owner-occupied housing units (estimated market value).",
  "B25064_001",    "Median monthly rent plus the estimated average monthly cost of utilities.",
  
  # --- COST BURDEN ---
  "B25070_010",    "Renters spending 50% or more of household income on gross rent.",
  "B25091_021",    "Owners spending 50% or more of household income on selected monthly owner costs.",
  "B25070_001",    "Total renter households for which gross rent is calculated (Denominator).",
  "B25091_001",    "Total owner households for which owner costs are calculated (Denominator).",
  
  # --- STRUCTURE ---
  "B25024_001",    "Total housing units (Structure Type Denominator).",
  "B25024_002",    "1-unit structures detached from any other house.",
  "B25024_003",    "1-unit structures attached to another house (e.g., row houses, townhomes).",
  "B25024_004",    "Structures containing exactly 2 housing units (duplexes).",
  "B25024_005",    "Structures containing 3 or 4 housing units.",
  "B25024_006",    "Structures containing 5 to 9 housing units.",
  "B25024_007",    "Structures containing 10 to 19 housing units.",
  "B25024_008",    "Structures containing 20 to 49 housing units.",
  "B25024_009",    "Structures containing 50 or more housing units.",
  "B25024_010",    "Mobile homes or trailers used as permanent housing.",
  "B25024_011",    "Non-traditional housing units like boats, RVs, or vans.",
  
  # --- AGE OF HOUSING ---
  "B25035_001",    "Median year the structure was originally constructed.",
  
  # --- HEATING ---
  "B25040_001",    "Total occupied housing units (Heating Fuel Denominator).",
  "B25040_002",    "Homes heated primarily by utility gas from underground pipes.",
  "B25040_003",    "Homes heated primarily by bottled, tank, or LP gas.",
  "B25040_004",    "Homes heated primarily by electricity.",
  "B25040_006",    "Homes heated primarily by wood.",
  
  # --- BURDEN BY INCOME (OWNERS) ---
  "B25106_003",    "Total owner households earning <$20k (Denominator).",
  "B25106_006",    "Owner households earning <$20k spending >30% of income on housing.",
  
  "B25106_007",    "Total owner households earning $20k-$34,999 (Denominator).",
  "B25106_010",    "Owner households earning $20k-$34,999 spending >30% of income on housing.",
  
  "B25106_011",    "Total owner households earning $35k-$49,999 (Denominator).",
  "B25106_014",    "Owner households earning $35k-$49,999 spending >30% of income on housing.",
  
  "B25106_015",    "Total owner households earning $50k-$74,999 (Denominator).",
  "B25106_018",    "Owner households earning $50k-$74,999 spending >30% of income on housing.",
  
  "B25106_019",    "Total owner households earning >$75k (Denominator).",
  "B25106_022",    "Owner households earning >$75k spending >30% of income on housing.",
  
  # --- BURDEN BY INCOME (RENTERS) ---
  "B25106_025",    "Total renter households earning <$20k (Denominator).",
  "B25106_028",    "Renter households earning <$20k spending >30% of income on housing.",
  
  "B25106_029",    "Total renter households earning $20k-$34,999 (Denominator).",
  "B25106_032",    "Renter households earning $20k-$34,999 spending >30% of income on housing.",
  
  "B25106_033",    "Total renter households earning $35k-$49,999 (Denominator).",
  "B25106_036",    "Renter households earning $35k-$49,999 spending >30% of income on housing.",
  
  "B25106_037",    "Total renter households earning $50k-$74,999 (Denominator).",
  "B25106_040",    "Renter households earning $50k-$74,999 spending >30% of income on housing.",
  
  "B25106_041",    "Total renter households earning >$75k (Denominator).",
  "B25106_044",    "Renter households earning >$75k spending >30% of income on housing.",
  
  "Calculated: Vacancy Rate", "Percentage of all housing units that are vacant (Vacant Units / Total Housing Units * 100)."
)


###############################
###############################
###############################
pop_definitions <- tribble(
  ~variable,       ~var_definition,
  
  # --- BASIC COUNTS ---
  "B01003_001",    "Total count of the population.",
  "B01002_001",    "Median age of the total population.",
  
  # --- RACE (B02001 Series - Includes Hispanic/Latino) ---
  # Note: These race categories count people regardless of ethnicity.
  # Summing these with 'Hispanic' will result in double-counting.
  "B02001_002",    "People identifying as White alone.",
  "B02001_003",    "People identifying as Black or African American alone.",
  "B02001_004",    "People identifying as American Indian and Alaska Native alone.",
  "B02001_005",    "People identifying as Asian alone.",
  "B02001_006",    "People identifying as Native Hawaiian and Other Pacific Islander alone.",
  "B02001_007",    "People identifying as some other race alone.",
  
  # --- TWO OR MORE RACES BREAKDOWN ---
  "B02001_008",    "Total people identifying with two or more races.",
  "B02001_009",    "People identifying with two races including 'Some other race'.",
  "B02001_010",    "People identifying with two races excluding 'Some other race', and three or more races.",
  
  # --- ETHNICITY (Overlapping) ---
  "B03003_003",    "People identifying as Hispanic or Latino (of any race).",
  
  # --- ALL AGE GROUPS (S0101 Subject Table) ---
  "S0101_C01_002", "Population aged under 5 years.",
  "S0101_C01_003", "Population aged 5 to 9 years.",
  "S0101_C01_004", "Population aged 10 to 14 years.",
  "S0101_C01_005", "Population aged 15 to 19 years.",
  "S0101_C01_006", "Population aged 20 to 24 years.",
  "S0101_C01_007", "Population aged 25 to 29 years.",
  "S0101_C01_008", "Population aged 30 to 34 years.",
  "S0101_C01_009", "Population aged 35 to 39 years.",
  "S0101_C01_010", "Population aged 40 to 44 years.",
  "S0101_C01_011", "Population aged 45 to 49 years.",
  "S0101_C01_012", "Population aged 50 to 54 years.",
  "S0101_C01_013", "Population aged 55 to 59 years.",
  "S0101_C01_014", "Population aged 60 to 64 years.",
  "S0101_C01_015", "Population aged 65 to 69 years.",
  "S0101_C01_016", "Population aged 70 to 74 years.",
  "S0101_C01_017", "Population aged 75 to 79 years.",
  "S0101_C01_018", "Population aged 80 to 84 years.",
  "S0101_C01_019", "Population aged 85 years and over.",
  
  # --- SUMMARY AGE GROUPS ---
  "S0101_C01_022", "Total population under 18 years of age.",
  "S0101_C01_030", "Total population 65 years and over.",  
  
  # --- AGE DEPENDENCY ---
  "S0101_C01_034", "Age dependency ratio: ((Pop <18 + Pop 65+) / Pop 18-64) * 100.",
  "S0101_C01_035", "Old-age dependency ratio: (Pop 65+ / Pop 18-64) * 100.",
  "S0101_C01_036", "Child dependency ratio: (Pop <18 / Pop 18-64) * 100.",
  
  # --- VETERANS ---
  "B21001_002",    "Civilian veterans 18 years and over.",
  
  # --- FOREIGN BORN ---
  "B05002_013",    "Foreign-born population (not a US citizen at birth).",
  
  # --- DENOMINATORS ---
  "B01003_001",    "Total population count (Base Denominator).",
  "S0101_C01_001", "Total population estimate from the Subject table (Age Denominator).",
  "B21001_001",    "Civilian population 18 years and over (Veterans Denominator)."
)

###############################
###############################
###############################

income_definitions <- tribble(
  ~variable,       ~var_definition,
  
  # --- KEY METRICS ---
  "B19013_001",    "Median household income in the past 12 months (inflation-adjusted).",
  "B19301_001",    "Per capita income in the past 12 months (inflation-adjusted).",
  
  # --- POVERTY METRICS ---
  "B17001_002",    "Total number of people whose income in the past 12 months is below the poverty level.",
  "B17001_004",    "Number of related children under 18 years below the poverty level.",
  "C17002_002",    "Number of people with income below 50% of the poverty level (Deep Poverty).",
  
  # --- POVERTY RATES (Subject Tables) ---
  "S1701_C03_001", "Percent of the total population for whom poverty status is determined who are below poverty level.",
  "S1701_C03_002", "Percent of the population under 18 years for whom poverty status is determined who are below poverty level.",
  "S1701_C03_010", "Percent of the population 65 years and over for whom poverty status is determined who are below poverty level.",
  
  # --- FULL INCOME BRACKETS (B19001) ---
  "B19001_002",    "Households with annual income less than $10,000.",
  "B19001_003",    "Households with annual income between $10,000 and $14,999.",
  "B19001_004",    "Households with annual income between $15,000 and $19,999.",
  "B19001_005",    "Households with annual income between $20,000 and $24,999.",
  "B19001_006",    "Households with annual income between $25,000 and $29,999.",
  "B19001_007",    "Households with annual income between $30,000 and $34,999.",
  "B19001_008",    "Households with annual income between $35,000 and $39,999.",
  "B19001_009",    "Households with annual income between $40,000 and $44,999.",
  "B19001_010",    "Households with annual income between $45,000 and $49,999.",
  "B19001_011",    "Households with annual income between $50,000 and $59,999.",
  "B19001_012",    "Households with annual income between $60,000 and $74,999.",
  "B19001_013",    "Households with annual income between $75,000 and $99,999.",
  "B19001_014",    "Households with annual income between $100,000 and $124,999.",
  "B19001_015",    "Households with annual income between $125,000 and $149,999.",
  "B19001_016",    "Households with annual income between $150,000 and $199,999.",
  "B19001_017",    "Households with annual income of $200,000 or more.",
  
  # --- DENOMINATORS ---
  "B19001_001",    "Total households (Denominator for income brackets).",
  "B17001_001",    "Total population for whom poverty status is determined (Denominator for poverty counts).",
  "C17002_001",    "Total population for whom poverty status is determined (Denominator for deep poverty)."
)



###############################
###############################
###############################

education_definitions <- tribble(
  ~variable,                                         ~var_definition,
  
  # --- 1. SCHOOL ENROLLMENT (Pop 3+) [B14001] ---
  "B14001_002",                                      "Total population 3 years and over enrolled in school.",
  "B14001_003",                                      "Enrolled in nursery school or preschool.",
  "B14001_004",                                      "Enrolled in kindergarten.",
  "B14001_005",                                      "Enrolled in grade 1 to grade 4.",
  "B14001_006",                                      "Enrolled in grade 5 to grade 8.",
  "B14001_007",                                      "Enrolled in grade 9 to grade 12.",
  "B14001_008",                                      "Enrolled in college, undergraduate years.",
  "B14001_009",                                      "Enrolled in graduate or professional school.",
  "B14001_010",                                      "Not enrolled in school.",
  
  # --- 2. CALCULATED SUMMARIES (From bind_education_summary) ---
  # These match the IDs created in your custom function: paste0("Calculated: ", label)
  "Calculated: Less than high school diploma",       "Population 25+ who have not received a high school diploma or equivalent.",
  "Calculated: High school graduate (includes equivalency)", "Population 25+ whose highest level of education is a regular high school diploma or GED.",
  "Calculated: Some college or associate's degree",  "Population 25+ with some college credit or an Associate's degree, but no Bachelor's degree.",
  "Calculated: Bachelor's degree or higher",         "Population 25+ with a Bachelor's, Master's, Professional, or Doctorate degree.",
  "Calculated: High school graduate or higher", "Population 25 years and over who have received at least a high school diploma or equivalent.",
  
  # --- 3. DETAILED ATTAINMENT (Pop 25+) [B15003] ---
  # Included if you ever need to show the raw "drill-down" data
  "B15003_002", "Completed no schooling.",
  "B15003_003", "Nursery school.",
  "B15003_004", "Kindergarten.",
  "B15003_005", "1st grade.",
  "B15003_006", "2nd grade.",
  "B15003_007", "3rd grade.",
  "B15003_008", "4th grade.",
  "B15003_009", "5th grade.",
  "B15003_010", "6th grade.",
  "B15003_011", "7th grade.",
  "B15003_012", "8th grade.",
  "B15003_013", "9th grade.",
  "B15003_014", "10th grade.",
  "B15003_015", "11th grade.",
  "B15003_016", "12th grade, no diploma.",
  "B15003_017", "Regular high school diploma.",
  "B15003_018", "GED or alternative credential.",
  "B15003_019", "Some college, less than 1 year.",
  "B15003_020", "Some college, 1 or more years, no degree.",
  "B15003_021", "Associate's degree.",
  "B15003_022", "Bachelor's degree.",
  "B15003_023", "Master's degree.",
  "B15003_024", "Professional school degree.",
  "B15003_025", "Doctorate degree.",
  
  # --- 4. DENOMINATORS ---
  "B14001_001", "Total population 3 years and over (Enrollment Denominator).",
  "B15003_001", "Total population 25 years and over (Attainment Denominator)."
)



###############################
###############################
###############################

employment_definitions <- tribble(
  ~variable,       ~var_definition,
  
  # --- LABOR FORCE STATUS (DP03) ---
  "DP03_0002",     "Population 16 years and over in the labor force (Civilian + Armed Forces).",
  "DP03_0003",     "Civilian population 16 years and over in the labor force.",
  "DP03_0004",     "Civilian employed population 16 years and over.",
  
  # --- UNEMPLOYMENT (DP03) ---
  "DP03_0005",     "Civilian unemployed population 16 years and over.",
  
  # --- NOT IN LABOR FORCE (DP03) ---
  "DP03_0007",     "Population 16 years and over not in the labor force (e.g., retired, students, etc.).",
  
  # --- CLASS OF WORKER (DP03) ---
  # Universe: Civilian employed population 16 years and over
  "DP03_0047",     "Private wage and salary workers.",
  "DP03_0048",     "Government workers (Federal, state, and local).",
  "DP03_0049",     "Self-employed in own not incorporated business workers.",
  "DP03_0050",     "Unpaid family workers.",
  
  # --- OCCUPATION (DP03) ---
  # Universe: Civilian employed population 16 years and over
  "DP03_0027",     "Workers in Management, business, science, and arts occupations.",
  "DP03_0028",     "Workers in Service occupations.",
  "DP03_0029",     "Workers in Sales and office occupations.",
  "DP03_0030",     "Workers in Natural resources, construction, and maintenance occupations.",
  "DP03_0031",     "Workers in Production, transportation, and material moving occupations.",
  
  # --- INDUSTRY (DP03) ---
  # Universe: Civilian employed population 16 years and over
  "DP03_0033",     "Industry: Agriculture, forestry, fishing and hunting, and mining.",
  "DP03_0034",     "Industry: Construction.",
  "DP03_0035",     "Industry: Manufacturing.",
  "DP03_0036",     "Industry: Wholesale trade.",
  "DP03_0037",     "Industry: Retail trade.",
  "DP03_0038",     "Industry: Transportation and warehousing, and utilities.",
  "DP03_0039",     "Industry: Information.",
  "DP03_0040",     "Industry: Finance and insurance, and real estate and rental and leasing.",
  "DP03_0041",     "Industry: Professional, scientific, and management, and administrative and waste management services.",
  "DP03_0042",     "Industry: Educational services, and health care and social assistance.",
  "DP03_0043",     "Industry: Arts, entertainment, and recreation, and accommodation and food services.",
  "DP03_0044",     "Industry: Other services, except public administration.",
  "DP03_0045",     "Industry: Public administration.",
  
  # --- EARNINGS (DP03) ---
  "DP03_0092",     "Median earnings (dollars) for workers 16 years and over with earnings.",
  "DP03_0093",     "Median earnings (dollars) for male full-time, year-round workers.",
  "DP03_0094",     "Median earnings (dollars) for female full-time, year-round workers.",
  
  # --- COMMUTING MODES (DP03) ---
  "DP03_0019",     "Workers 16 years and over who drove alone to work.",
  "DP03_0020",     "Workers 16 years and over who carpooled to work.",
  "DP03_0021",     "Workers 16 years and over who used public transportation (excluding taxicab).",
  "DP03_0022",     "Workers 16 years and over who walked to work.",
  "DP03_0024",     "Workers 16 years and over who worked from home.",
  
  # --- COMMUTE TIME (DP03) ---
  "DP03_0025",     "Mean travel time to work (minutes) for workers 16 years and over who did not work at home.",
  
  # --- WORK LOCATIONS (B08007) ---
  "B08007_003",    "Workers 16 years and over who worked in their county of residence.",
  "B08007_004",    "Workers 16 years and over who worked outside their county of residence.",
  
  # --- DENOMINATORS ---
  "DP03_0001",     "Total population 16 years and over (Labor Market Denominator).",
  "DP03_0018",     "Workers 16 years and over (Means of Transportation Denominator).",
  "B08007_001",    "Total workers 16 years and over (Work Location Denominator)."
)

###############################
###############################
###############################

industry_earnings_definitions <- tribble(
  ~variable,       ~var_definition,
  
  # --- BASELINE TOTALS ---
  "S2414_C01_001", "Median earnings for the total civilian employed population 16 years and over with earnings.",
  "S2414_C02_001", "Median earnings for the male civilian employed population 16 years and over with earnings.",
  "S2414_C03_001", "Median earnings for the female civilian employed population 16 years and over with earnings.",
  
  # --- AG, FORESTRY, FISHING, MINING ---
  "S2414_C01_002", "Median earnings (Total) in Agriculture, forestry, fishing and hunting, and mining.",
  "S2414_C02_002", "Median earnings (Male) in Agriculture, forestry, fishing and hunting, and mining.",
  "S2414_C03_002", "Median earnings (Female) in Agriculture, forestry, fishing and hunting, and mining.",
  
  # --- CONSTRUCTION ---
  "S2414_C01_005", "Median earnings (Total) in Construction.",
  "S2414_C02_005", "Median earnings (Male) in Construction.",
  "S2414_C03_005", "Median earnings (Female) in Construction.",
  
  # --- MANUFACTURING ---
  "S2414_C01_006", "Median earnings (Total) in Manufacturing.",
  "S2414_C02_006", "Median earnings (Male) in Manufacturing.",
  "S2414_C03_006", "Median earnings (Female) in Manufacturing.",
  
  # --- WHOLESALE TRADE ---
  "S2414_C01_007", "Median earnings (Total) in Wholesale trade.",
  "S2414_C02_007", "Median earnings (Male) in Wholesale trade.",
  "S2414_C03_007", "Median earnings (Female) in Wholesale trade.",
  
  # --- RETAIL TRADE ---
  "S2414_C01_008", "Median earnings (Total) in Retail trade.",
  "S2414_C02_008", "Median earnings (Male) in Retail trade.",
  "S2414_C03_008", "Median earnings (Female) in Retail trade.",
  
  # --- TRANSPO, WAREHOUSING, UTILS ---
  "S2414_C01_009", "Median earnings (Total) in Transportation and warehousing, and utilities.",
  "S2414_C02_009", "Median earnings (Male) in Transportation and warehousing, and utilities.",
  "S2414_C03_009", "Median earnings (Female) in Transportation and warehousing, and utilities.",
  
  # --- INFORMATION ---
  "S2414_C01_012", "Median earnings (Total) in Information.",
  "S2414_C02_012", "Median earnings (Male) in Information.",
  "S2414_C03_012", "Median earnings (Female) in Information.",
  
  # --- FINANCE, INSURANCE, REAL ESTATE ---
  "S2414_C01_013", "Median earnings (Total) in Finance and insurance, and real estate and rental and leasing.",
  "S2414_C02_013", "Median earnings (Male) in Finance and insurance, and real estate and rental and leasing.",
  "S2414_C03_013", "Median earnings (Female) in Finance and insurance, and real estate and rental and leasing.",
  
  # --- PROF, SCIENTIFIC, MGMT, ADMIN ---
  "S2414_C01_016", "Median earnings (Total) in Professional, scientific, and management, and administrative and waste management services.",
  "S2414_C02_016", "Median earnings (Male) in Professional, scientific, and management, and administrative and waste management services.",
  "S2414_C03_016", "Median earnings (Female) in Professional, scientific, and management, and administrative and waste management services.",
  
  # --- EDU, HEALTH, SOCIAL ASSIST ---
  "S2414_C01_020", "Median earnings (Total) in Educational services, and health care and social assistance.",
  "S2414_C02_020", "Median earnings (Male) in Educational services, and health care and social assistance.",
  "S2414_C03_020", "Median earnings (Female) in Educational services, and health care and social assistance.",
  
  # --- ARTS, ENT, REC, FOOD SVCS ---
  "S2414_C01_023", "Median earnings (Total) in Arts, entertainment, and recreation, and accommodation and food services.",
  "S2414_C02_023", "Median earnings (Male) in Arts, entertainment, and recreation, and accommodation and food services.",
  "S2414_C03_023", "Median earnings (Female) in Arts, entertainment, and recreation, and accommodation and food services.",
  
  # --- OTHER SERVICES (PUBLIC ADMIN) ---
  "S2414_C01_026", "Median earnings (Total) in Other services, except public administration.",
  "S2414_C02_026", "Median earnings (Male) in Other services, except public administration.",
  "S2414_C03_026", "Median earnings (Female) in Other services, except public administration.",
  
  # --- PUBLIC ADMINISTRATION ---
  "S2414_C01_027", "Median earnings (Total) in Public administration.",
  "S2414_C02_027", "Median earnings (Male) in Public administration.",
  "S2414_C03_027", "Median earnings (Female) in Public administration."
)


###############################
###############################
###############################

health_definitions <- tribble(
  ~variable,       ~var_definition,
  
  # --- HEALTH INSURANCE (S2701) ---
  "S2701_C05_001", "Civilian noninstitutionalized population with no health insurance coverage.",
  "S2701_C02_001", "Civilian noninstitutionalized population with private health insurance.",
  "S2701_C03_001", "Civilian noninstitutionalized population with public coverage.",
  
  # --- DISABILITY (S1810) ---
  "S1810_C02_001", "Total civilian noninstitutionalized population with a disability.",
  "S1810_C03_001", "Percent of the total civilian noninstitutionalized population with a disability.",
  
  "S1810_C02_002", "Population under 18 years with a disability.",
  "S1810_C02_014", "Population 65 years and over with a disability.",
  
  # --- BIRTHS (B13002) ---
  "B13002_002",    "Women 15 to 50 years old who gave birth in the past 12 months.",
  
  # --- DENOMINATORS ---
  "S2701_C01_001", "Total civilian noninstitutionalized population (Health Insurance Denominator).",
  "S1810_C01_001", "Total civilian noninstitutionalized population (Disability Denominator).",
  "S1810_C01_002", "Total civilian noninstitutionalized population under 18 years (Disability Denominator).",
  "S1810_C01_014", "Total civilian noninstitutionalized population 65 years and over (Disability Denominator).",
  "B13002_001",    "Women 15 to 50 years old (Births Denominator)."
)




###############################
###############################
###############################

age_sex_definitions <- tribble(
  ~variable,                               ~var_definition,
  
  # --- 1. Total population (and by sex) BY AGE (Both Sexes) ---
  "Calculated (B01001): 0-4 years",      "Total population (and by sex) aged 0 to 4 years.",
  "Calculated (B01001): 5-9 years",      "Total population (and by sex) aged 5 to 9 years.",
  "Calculated (B01001): 10-14 years",    "Total population (and by sex) aged 10 to 14 years.",
  "Calculated (B01001): 15-19 years",    "Total population (and by sex) aged 15 to 19 years.",
  "Calculated (B01001): 20-24 years",    "Total population (and by sex) aged 20 to 24 years.",
  "Calculated (B01001): 25-29 years",    "Total population (and by sex) aged 25 to 29 years.",
  "Calculated (B01001): 30-34 years",    "Total population (and by sex) aged 30 to 34 years.",
  "Calculated (B01001): 35-39 years",    "Total population (and by sex) aged 35 to 39 years.",
  "Calculated (B01001): 40-44 years",    "Total population (and by sex) aged 40 to 44 years.",
  "Calculated (B01001): 45-49 years",    "Total population (and by sex) aged 45 to 49 years.",
  "Calculated (B01001): 50-54 years",    "Total population (and by sex) aged 50 to 54 years.",
  "Calculated (B01001): 55-59 years",    "Total population (and by sex) aged 55 to 59 years.",
  "Calculated (B01001): 60-64 years",    "Total population (and by sex) aged 60 to 64 years.",
  "Calculated (B01001): 65-69 years",    "Total population (and by sex) aged 65 to 69 years.",
  "Calculated (B01001): 70-74 years",    "Total population (and by sex) aged 70 to 74 years.",
  "Calculated (B01001): 75-79 years",    "Total population (and by sex) aged 75 to 79 years.",
  "Calculated (B01001): 80-84 years",    "Total population (and by sex) aged 80 to 84 years.",
  "Calculated (B01001): 85+ years",      "Total population (and by sex) aged 85 years and over."
)


################################################################################################
################################################################################################
#--- save mapped variable definitions
#--- append table source text and link


# --- Load Reference Data (The Table Name Lookup) ---
v23_all <- bind_rows(
  load_variables(2023, "acs5", cache = TRUE),
  load_variables(2023, "acs5/profile", cache = TRUE),
  load_variables(2023, "acs5/subject", cache = TRUE)
)

table_lookup <- v23_all %>%
  mutate(table_id = str_extract(name, "^[A-Za-z0-9]+")) %>%
  distinct(table_id, .keep_all = TRUE) %>%
  select(table_id, table_name = concept)

# --- Combine Your Topic Definitions ---
acs_definitions <- bind_rows(
  list(
    Population = pop_definitions,
    Housing    = housing_definitions,
    Income     = income_definitions,
    Education  = education_definitions,
    Employment = employment_definitions,
    Health     = health_definitions,
    `Industry Earnings` = industry_earnings_definitions,
    `Age Sex Detail`    = age_sex_definitions
  ),
  .id = "category" 
) %>%
  distinct(variable, .keep_all = TRUE)

# --- Append source text and links ---
# Lewis and Clark County
fips_code <- "30049" 

master_acs_definitions <- acs_definitions %>%
  mutate(
    is_calc = str_starts(variable, "Calculated"),
    table_root = if_else(is_calc, NA_character_, str_extract(variable, "^[^_]+"))
  ) %>%

  left_join(table_lookup, by = c("table_root" = "table_id")) %>%
  
  mutate(
    table_name = case_when(
      is_calc ~ "NA: custom calculated metric",
      is.na(table_name) ~ "Detailed Tables", 
      TRUE ~ str_to_title(table_name) 
    ),
    
    link_data_census = if_else(
      is_calc,
      NA_character_, 
      paste0("https://data.census.gov/table?q=", table_root, "&g=050XX00US", fips_code)
    ),

    source_text = case_when(
      is_calc ~ "Manually calculated variable from one or more U.S. Census Bureau Estimates.",
      TRUE ~ paste0("U.S. Census Bureau. ", table_name, ". American Community Survey 5-Year Estimates. Table ", table_root, ".")
    )
  ) %>%
  select(-table_root, -is_calc)



# ---Save Final Variable Definition + Source DF ---

# Save RDS for Shiny (Preserves types)
saveRDS(master_acs_definitions, here("data/007_data/master_acs_definitions.rds"))

# Save CSV for humans (Verification)
write_csv(master_acs_definitions, here("variable_maps/master_acs_definitions.csv"))