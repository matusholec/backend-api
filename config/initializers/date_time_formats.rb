Date::DATE_FORMATS[:default] = '%d/%m/%Y'
Date::DATE_FORMATS[:underscore_separated] = '%m_%d_%Y'
Date::DATE_FORMATS[:ordinal_date] = ->(date) { date.strftime("#{date.day.ordinalize} %B %Y") }
Time::DATE_FORMATS[:default_date] = '%d/%m/%Y'
Time::DATE_FORMATS[:default_datetime] = '%d/%m/%Y %H:%M'
