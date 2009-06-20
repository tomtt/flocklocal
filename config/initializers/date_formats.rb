

# Wednesday 12 August 08, 06:30pm
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:human_long] = '%A %d %B %Y %l:%M%p'
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:human_long] = '%A %d %B %Y'

# 3 March 2009
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:simple_date] = '%d %B %Y'
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:simple_date] = '%d %B %Y'

# March
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:month_name] = '%B'
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:month_name] = '%B'

# 11:00AM
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:simple_time] = '%l:%M%p'
