# frozen_string_literal: true

And(/^I enter "([^"]*)" into the course search bar$/) do |arg|
  find(:xpath, '//*[@id="courseID"]').set(arg)
end
