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
    xscenario 'prompts user to fill out a form, then displays the new restaurant' do

    end
  end

  context 'viewing restaurants' do
   xscenario 'lets a user view a restaurant' do

    end
  end

  context 'editing restaurants' do


    xscenario 'let a user edit a restaurant' do

    end
  end

  context 'deleting restaurants' do

    xscenario 'remove a restaurant when a user click remove' do

    end
  end

end
