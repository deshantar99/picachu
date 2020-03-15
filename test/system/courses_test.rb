# frozen_string_literal: true

require 'application_system_test_case'

class CoursesTest < ApplicationSystemTestCase
  setup { @course = courses(:one) }

  test 'visiting the index' do
    visit courses_url
    assert_selector 'h1', text: 'Courses'
  end

  test 'creating a Course' do
    visit courses_url
    click_on 'New Course'

    fill_in 'Course num', with: @course.course_num
    fill_in 'Dept', with: @course.dept
    fill_in 'Name', with: @course.name
    click_on 'Create Course'

    assert_text 'Course was successfully created'
    click_on 'Back'
  end

  test 'updating a Course' do
    visit courses_url
    click_on 'Edit', match: :first

    fill_in 'Course num', with: @course.course_num
    fill_in 'Dept', with: @course.dept
    fill_in 'Name', with: @course.name
    click_on 'Update Course'

    assert_text 'Course was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Course' do
    visit courses_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Course was successfully destroyed'
  end
end