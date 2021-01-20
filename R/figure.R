# library(ggplot2)
# library(dplyr)
#
# adae <- haven::read_sas("/home/bjungbogati/Desktop/docs/adam/adae.sas7bdat")
#
# View(adae)
#
# ad_data <- adae %>% filter(AEDECOD %in% c("Headache", "Abdominal pain","Muscle strain", "Erythema",
# "Hepatic steatosis", "Nasopharyngitis", "Upper respiratory tract infection",
# "Diarrhoea", "Pyrexia", "Fatigue", "Syphilis", "Cough","Haemorrhoids", "Nausea"))
#
# ad_count <- ad_data %>%
#   count(TRT01A, AEDECOD, sort = T) %>%
#   mutate(n = n / sum(n) * 100)
#
# View(ad_count)
#
# ggplot(ad_count, aes(x = n, y = AEDECOD, col= TRT01A)) + geom_point()
