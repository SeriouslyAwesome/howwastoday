feature 'Adding a review' do
  it 'shows a confirmation message' do
    visit root_path

    choose 'review_rating_5'
    click_on 'Submit'

    expect(page).to have_content 'Thanks!'
  end
end
