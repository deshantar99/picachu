# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  fixtures :courses, :professors, :reviews
  setup do
    @review = reviews(:one)
    @professor = professors(:one)
    @course = courses(:one)
  end

  it 'should get the new page' do
    get new_review_url
    expect(response).to have_http_status(:success)
  end

  it 'should create a new review' do
    expect {
      post reviews_url(professor_id: @professor.id, course_id: @course.id),
           params: {
             review: {
               attendance_mandatory: @review.attendance_mandatory,
               cared_about_material: @review.cared_about_material,
               cared_about_students: @review.cared_about_students,
               clear_explanations: @review.clear_explanations,
               clear_grading: @review.clear_grading,
               course_format: @review.course_format,
               course_id: @course.id,
               course_other_thoughts: @review.course_other_thoughts,
               course_required: @review.course_required,
               difficult: @review.difficult,
               fast_grading: @review.fast_grading,
               homework_heavy: @review.homework_heavy,
               interesting: @review.interesting,
               letter_grade: @review.letter_grade,
               open_to_questions: @review.open_to_questions,
               overall_rating: @review.overall_rating,
               professor_id: @professor.id,
               professor_other_thoughts: @review.professor_other_thoughts,
               semester: @review.semester,
               standardized_course: @review.standardized_course,
               used_textbook: @review.used_textbook,
               year: @review.year
             }
           }
    }.to change { Review.count }.by(1)

    expect(response).to redirect_to(professor_url(@professor.id))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(flash[:notice]).to_not be nil
  end

  it 'should update a review' do
    patch review_url @review,
                     params: {
                       review: {
                         attendance_mandatory: @review.attendance_mandatory,
                         cared_about_material: @review.cared_about_material,
                         cared_about_students: @review.cared_about_students,
                         clear_explanations: @review.clear_explanations,
                         clear_grading: @review.clear_grading,
                         course_format: @review.course_format,
                         course_id: @course.id,
                         course_other_thoughts: @review.course_other_thoughts,
                         course_required: @review.course_required,
                         difficult: @review.difficult,
                         fast_grading: @review.fast_grading,
                         homework_heavy: @review.homework_heavy,
                         interesting: @review.interesting,
                         letter_grade: @review.letter_grade,
                         open_to_questions: @review.open_to_questions,
                         overall_rating: @review.overall_rating,
                         professor_id: @professor.id,
                         professor_other_thoughts:
                           @review.professor_other_thoughts,
                         semester: 'test',
                         standardized_course: @review.standardized_course,
                         used_textbook: @review.used_textbook,
                         year: @review.year
                       }
                     }
    expect(response).to redirect_to(professor_url(@professor))
  end

  it 'should destroy a review' do
    expect { delete review_url @review }.to change { Review.count }.by(-1)
    expect(response).to redirect_to professor_url(@professor)
  end
end