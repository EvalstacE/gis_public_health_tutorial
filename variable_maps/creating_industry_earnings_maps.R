###--summary vars different for 2013
industry_vars <- s_v23 %>%
  bind_rows(s_v18, s_v13) %>%
  filter(
    str_starts(name, "S2414_C0|S2404_C0")
  )

industry_2013_vars <- industry_vars %>% filter(year == 2013)

###--data profile vars SAME across all years 
industry_vars_dp <- d_23 %>%
  bind_rows(d_18, d_13) %>%
  filter(
    str_starts(name, "DP03")
  )

#write.csv(industry_vars, "industry_vars.csv", row.names = FALSE)
#write.csv(industry_2013_vars, "industry_2013_vars.csv", row.names = FALSE)
#write.csv(industry_vars_dp, "industry_vars_dp.csv", row.names = FALSE)







################################################################################################
################################################################################################
#### industry earnings table 

industry_earnings_ref <- tribble(
  ~label,                                    ~variable,       ~stat_type,  ~denominator, ~category,
  
  # --- BASELINE TOTALS (S2414: Median Earnings, Full-Time, Year-Round) ---
  "Overall Median Earnings (Total)",         "S2414_C01_001", "currency",  NA,           "Industry Earnings",
  "Overall Median Earnings (Male)",          "S2414_C02_001", "currency",  NA,           "Industry Earnings",
  "Overall Median Earnings (Female)",        "S2414_C03_001", "currency",  NA,           "Industry Earnings",
  
  # --- AG, FORESTRY, FISHING, MINING ---
  "Ag, Forestry, Fishing, Mining (Total)",   "S2414_C01_002", "currency",  NA,           "Industry Earnings",
  "Ag, Forestry, Fishing, Mining (Male)",    "S2414_C02_002", "currency",  NA,           "Industry Earnings",
  "Ag, Forestry, Fishing, Mining (Female)",  "S2414_C03_002", "currency",  NA,           "Industry Earnings",
  
  # --- CONSTRUCTION ---
  "Construction (Total)",                    "S2414_C01_005", "currency",  NA,           "Industry Earnings",
  "Construction (Male)",                     "S2414_C02_005", "currency",  NA,           "Industry Earnings",
  "Construction (Female)",                   "S2414_C03_005", "currency",  NA,           "Industry Earnings",
  
  # --- MANUFACTURING ---
  "Manufacturing (Total)",                   "S2414_C01_006", "currency",  NA,           "Industry Earnings",
  "Manufacturing (Male)",                    "S2414_C02_006", "currency",  NA,           "Industry Earnings",
  "Manufacturing (Female)",                  "S2414_C03_006", "currency",  NA,           "Industry Earnings",
  
  # --- WHOLESALE TRADE ---
  "Wholesale Trade (Total)",                 "S2414_C01_007", "currency",  NA,           "Industry Earnings",
  "Wholesale Trade (Male)",                  "S2414_C02_007", "currency",  NA,           "Industry Earnings",
  "Wholesale Trade (Female)",                "S2414_C03_007", "currency",  NA,           "Industry Earnings",
  
  # --- RETAIL TRADE ---
  "Retail Trade (Total)",                    "S2414_C01_008", "currency",  NA,           "Industry Earnings",
  "Retail Trade (Male)",                     "S2414_C02_008", "currency",  NA,           "Industry Earnings",
  "Retail Trade (Female)",                   "S2414_C03_008", "currency",  NA,           "Industry Earnings",
  
  # --- TRANSPO, WAREHOUSING, UTILS ---
  "Transpo, Warehousing, Utils (Total)",     "S2414_C01_009", "currency",  NA,           "Industry Earnings",
  "Transpo, Warehousing, Utils (Male)",      "S2414_C02_009", "currency",  NA,           "Industry Earnings",
  "Transpo, Warehousing, Utils (Female)",    "S2414_C03_009", "currency",  NA,           "Industry Earnings",
  
  # --- INFORMATION ---
  "Information (Total)",                     "S2414_C01_012", "currency",  NA,           "Industry Earnings",
  "Information (Male)",                      "S2414_C02_012", "currency",  NA,           "Industry Earnings",
  "Information (Female)",                    "S2414_C03_012", "currency",  NA,           "Industry Earnings",
  
  # --- FINANCE, INSURANCE, REAL ESTATE ---
  "Finance, Insurance, Real Est (Total)",    "S2414_C01_013", "currency",  NA,           "Industry Earnings",
  "Finance, Insurance, Real Est (Male)",     "S2414_C02_013", "currency",  NA,           "Industry Earnings",
  "Finance, Insurance, Real Est (Female)",   "S2414_C03_013", "currency",  NA,           "Industry Earnings",
  
  # --- PROF, SCIENTIFIC, MGMT, ADMIN ---
  "Prof, Scientific, Mgmt, Admin (Total)",   "S2414_C01_016", "currency",  NA,           "Industry Earnings",
  "Prof, Scientific, Mgmt, Admin (Male)",    "S2414_C02_016", "currency",  NA,           "Industry Earnings",
  "Prof, Scientific, Mgmt, Admin (Female)",  "S2414_C03_016", "currency",  NA,           "Industry Earnings",
  
  # --- EDU, HEALTH, SOCIAL ASSIST ---
  "Edu, Health, Social Assist (Total)",      "S2414_C01_020", "currency",  NA,           "Industry Earnings",
  "Edu, Health, Social Assist (Male)",       "S2414_C02_020", "currency",  NA,           "Industry Earnings",
  "Edu, Health, Social Assist (Female)",     "S2414_C03_020", "currency",  NA,           "Industry Earnings",
  
  # --- ARTS, ENT, REC, FOOD SVCS ---
  "Arts, Ent, Rec, Food Svcs (Total)",       "S2414_C01_023", "currency",  NA,           "Industry Earnings",
  "Arts, Ent, Rec, Food Svcs (Male)",        "S2414_C02_023", "currency",  NA,           "Industry Earnings",
  "Arts, Ent, Rec, Food Svcs (Female)",      "S2414_C03_023", "currency",  NA,           "Industry Earnings",
  
  # --- OTHER SERVICES (PUBLIC ADMIN) ---
  "Other Services (Public Admin) (Total)",   "S2414_C01_026", "currency",  NA,           "Industry Earnings",
  "Other Services (Public Admin) (Male)",    "S2414_C02_026", "currency",  NA,           "Industry Earnings",
  "Other Services (Public Admin) (Female)",  "S2414_C03_026", "currency",  NA,           "Industry Earnings",
  
  # --- PUBLIC ADMINISTRATION ---
  "Public Administration (Total)",           "S2414_C01_027", "currency",  NA,           "Industry Earnings",
  "Public Administration (Male)",            "S2414_C02_027", "currency",  NA,           "Industry Earnings",
  "Public Administration (Female)",          "S2414_C03_027", "currency",  NA,           "Industry Earnings"
)



industry_earnings_2013_ref <- tribble(
  ~label,                            ~variable,       ~stat_type,  ~denominator, ~category,
  
  # --- BASELINE TOTALS ---
  # C04 = Total, C05 = Male, C06 = Female
  "Overall Median Earnings (Total)", "S2404_C04_001", "currency",  NA,           "Industry Earnings",
  "Overall Median Earnings (Male)",  "S2404_C05_001", "currency",  NA,           "Industry Earnings",
  "Overall Median Earnings (Female)", "S2404_C06_001", "currency",  NA,           "Industry Earnings",
  
  # --- AG, FORESTRY, FISHING, MINING ---
  "Ag, Forestry, Fishing, Mining (Total)",   "S2404_C04_002", "currency",  NA,   "Industry Earnings",
  "Ag, Forestry, Fishing, Mining (Male)",    "S2404_C05_002", "currency",  NA,   "Industry Earnings",
  "Ag, Forestry, Fishing, Mining (Female)",  "S2404_C06_002", "currency",  NA,   "Industry Earnings",
  
  # --- CONSTRUCTION ---
  "Construction (Total)",            "S2404_C04_005", "currency",  NA,           "Industry Earnings",
  "Construction (Male)",             "S2404_C05_005", "currency",  NA,           "Industry Earnings",
  "Construction (Female)",           "S2404_C06_005", "currency",  NA,           "Industry Earnings",
  
  # --- MANUFACTURING ---
  "Manufacturing (Total)",           "S2404_C04_006", "currency",  NA,           "Industry Earnings",
  "Manufacturing (Male)",            "S2404_C05_006", "currency",  NA,           "Industry Earnings",
  "Manufacturing (Female)",          "S2404_C06_006", "currency",  NA,           "Industry Earnings",
  
  # --- WHOLESALE TRADE ---
  "Wholesale Trade (Total)",         "S2404_C04_007", "currency",  NA,           "Industry Earnings",
  "Wholesale Trade (Male)",          "S2404_C05_007", "currency",  NA,           "Industry Earnings",
  "Wholesale Trade (Female)",        "S2404_C06_007", "currency",  NA,           "Industry Earnings",
  
  # --- RETAIL TRADE ---
  "Retail Trade (Total)",            "S2404_C04_008", "currency",  NA,           "Industry Earnings",
  "Retail Trade (Male)",             "S2404_C05_008", "currency",  NA,           "Industry Earnings",
  "Retail Trade (Female)",           "S2404_C06_008", "currency",  NA,           "Industry Earnings",
  
  # --- TRANSPO, WAREHOUSING, UTILS ---
  "Transpo, Warehousing, Utils (Total)",   "S2404_C04_009", "currency",  NA,     "Industry Earnings",
  "Transpo, Warehousing, Utils (Male)",    "S2404_C05_009", "currency",  NA,     "Industry Earnings",
  "Transpo, Warehousing, Utils (Female)",  "S2404_C06_009", "currency",  NA,     "Industry Earnings",
  
  # --- INFORMATION ---
  "Information (Total)",             "S2404_C04_012", "currency",  NA,           "Industry Earnings",
  "Information (Male)",              "S2404_C05_012", "currency",  NA,           "Industry Earnings",
  "Information (Female)",            "S2404_C06_012", "currency",  NA,           "Industry Earnings",
  
  # --- FINANCE, INSURANCE, REAL ESTATE ---
  "Finance, Insurance, Real Est (Total)",  "S2404_C04_013", "currency",  NA,     "Industry Earnings",
  "Finance, Insurance, Real Est (Male)",   "S2404_C05_013", "currency",  NA,     "Industry Earnings",
  "Finance, Insurance, Real Est (Female)", "S2404_C06_013", "currency",  NA,     "Industry Earnings",
  
  # --- PROF, SCIENTIFIC, MGMT, ADMIN ---
  "Prof, Scientific, Mgmt, Admin (Total)", "S2404_C04_016", "currency",  NA,     "Industry Earnings",
  "Prof, Scientific, Mgmt, Admin (Male)",  "S2404_C05_016", "currency",  NA,     "Industry Earnings",
  "Prof, Scientific, Mgmt, Admin (Female)","S2404_C06_016", "currency",  NA,     "Industry Earnings",
  
  # --- EDU, HEALTH, SOCIAL ASSIST ---
  "Edu, Health, Social Assist (Total)",    "S2404_C04_020", "currency",  NA,     "Industry Earnings",
  "Edu, Health, Social Assist (Male)",     "S2404_C05_020", "currency",  NA,     "Industry Earnings",
  "Edu, Health, Social Assist (Female)",   "S2404_C06_020", "currency",  NA,     "Industry Earnings",
  
  # --- ARTS, ENT, REC, FOOD SVCS ---
  "Arts, Ent, Rec, Food Svcs (Total)",     "S2404_C04_023", "currency",  NA,     "Industry Earnings",
  "Arts, Ent, Rec, Food Svcs (Male)",      "S2404_C05_023", "currency",  NA,     "Industry Earnings",
  "Arts, Ent, Rec, Food Svcs (Female)",    "S2404_C06_023", "currency",  NA,     "Industry Earnings",
  
  # --- OTHER SERVICES (PUBLIC ADMIN) ---
  "Other Services (Public Admin) (Total)", "S2404_C04_026", "currency",  NA,     "Industry Earnings",
  "Other Services (Public Admin) (Male)",  "S2404_C05_026", "currency",  NA,     "Industry Earnings",
  "Other Services (Public Admin) (Female)","S2404_C06_026", "currency",  NA,     "Industry Earnings",
  
  # --- PUBLIC ADMINISTRATION ---
  "Public Administration (Total)",         "S2404_C04_027", "currency",  NA,     "Industry Earnings",
  "Public Administration (Male)",          "S2404_C05_027", "currency",  NA,     "Industry Earnings",
  "Public Administration (Female)",        "S2404_C06_027", "currency",  NA,     "Industry Earnings"
)






write_csv(industry_earnings_ref, here("variable_maps/industry_earnings_vars_map.csv"))

write_csv(industry_earnings_2013_ref, here("variable_maps/industry_earnings_2013_vars_map.csv"))
