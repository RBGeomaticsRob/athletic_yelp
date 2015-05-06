require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do

    before { Restaurant.create(name: 'KFC') }

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'KFC'
    end
  end

  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'KFC'
    end
  end

  context 'viewing restaurants' do

    let!(:kfc) { Restaurant.create(name: 'KFC') }

    scenario 'lets a user view a restaurant' do
      visit '/restaurants'
      click_link 'KFC'
      expect(current_path).to eq "/restaurants/#{kfc.id}"
      expect(page).to have_content 'KFC'
    end
  end

  context 'editing restaurants' do

    before { Restaurant.create(name: 'KFC') }

    scenario 'let a user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit KFC'
      fill_in 'Name', with: 'McDonalds'
      click_button 'Update Restaurant'
      expect(current_path).to eq 'restaurants'
      expect(page).to have_content 'McDonalds'
    end
  end

  context 'deleting restaurants' do

    xscenario 'remove a restaurant when a user click remove' do

    end
  end

end
