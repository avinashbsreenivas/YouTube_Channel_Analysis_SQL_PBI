-- 1b Percent of pay per continent
with percent_pay as
(
select 
	case
     when Country in ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
          "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
          "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
          "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
          "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
          "South Sudan","Sudan","Tanzania""Togo","Tunisia","Uganda","Zambia","Zimbabwe") then 'Africa'

     when Country in ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
          "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
          "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
          "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
          "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
         "Ukraine","United Kingdom","Vatican City") then 'Europe'

     when Country in ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
        "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
        "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
        "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
        "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") then 'Asia'

     when Country in ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
         "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
        "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") then 'North_America'

     when Country in ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
         "Uruguay","Venezuela") then 'South_America'

     when Country in ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
         "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") then 'Australia_and_Oceania '
	end as continents,
    
    round(sum(highest_yearly_earnings),0) as earning_per_continent
from `global youtube statistics`
group by 1
)
select
	sum(earning_per_continent) as earning_p_continent,
	round(1.0 * sum(case when continents = 'Africa' then earning_per_continent else 0 end)/nullif(sum(earning_per_continent), 0) * 100, 2) as percent_earning_Africa,
    round(1.0 * sum(case when continents = 'North_America' then earning_per_continent else 0 end)/nullif(sum(earning_per_continent), 0) * 100, 2) as percent_earning_North_America,
    round(1.0 * sum(case when continents = 'Asia' then earning_per_continent else 0 end)/nullif(sum(earning_per_continent), 0) * 100, 2) as percent_earning_Asia,
    round(1.0 * sum(case when continents = 'South_America' then earning_per_continent else 0 end)/nullif(sum(earning_per_continent), 0) * 100, 2) as percent_earning_South_America,
    round(1.0 * sum(case when continents = 'Europe' then earning_per_continent else 0 end)/nullif(sum(earning_per_continent), 0) * 100, 2) as percent_earning_Europe,
    round(1.0 * sum(case when continents = 'Australia_and_Oceania' then earning_per_continent else 0 end)/ nullif(sum(earning_per_continent),0) *100,2) as pct_earnings_Australia_and_Oceania
from percent_pay
