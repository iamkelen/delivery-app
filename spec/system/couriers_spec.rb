RSpec.describe 'Creating Courier', type: :system do
  context 'when create a new courier' do
    it 'creates a courier' do
      visit 'couriers/new'
      fill_in 'Name', with: 'John'
      fill_in 'Email', with: 'john@doe.com'
      click_button 'Create Courier'
      expect(page).to have_text('Courier was successfully created.')
    end

    it 'returns validation errors' do
      visit new_courier_path
      click_button 'Create Courier'
      expect(page).to have_content 'can\'t be blank'
    end
  end

  context 'when update an existing courier' do
    let(:courier) { Courier.create(name: 'John', email: 'john.doe@example.com') }
    it 'successfully updates the courier' do
      visit edit_courier_path(courier)
      fill_in 'Name', with: 'Jane'
      fill_in 'Email', with: 'jane.doe@example.com'
      click_button 'Update Courier'
      expect(page).to have_content 'Courier was successfully updated.'
      expect(page).to have_content 'jane.doe@example.com'
    end
  end

  context 'when delete an existing courier' do
    let(:courier) { Courier.create(name: 'John', email: 'john.doe@example.com') }
    it 'successfully deletes the courier' do
      visit couriers_path(courier)
      accept_confirm do
        click_link 'Delete'
      end
      expect(page).not_to have_content 'john.doe@example.com'
    end
  end
end
