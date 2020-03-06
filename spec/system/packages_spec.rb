RSpec.describe 'Creating Package', type: :system do
  let(:courier) { Courier.create!(name: 'John', email: 'john@doe.com') }

  context 'when create a new package' do
    it 'creates a package' do
      visit new_courier_package_path(courier)
      fill_in 'Tracking number', with: '#1'
      check 'Delivery status'
      click_button 'Create Package'
      expect(page).to have_text('Package was successfully created.')
    end

    it 'returns validation errors' do
      visit new_courier_package_path(courier)
      click_button 'Create Package'
      expect(page).to have_content 'can\'t be blank'
    end
  end

  context 'when update an existing package' do
    let(:package) { Package.create!(tracking_number: '#2', delivery_status: 'true', courier: courier) }
    it 'successfully updates the package' do
      visit edit_package_path(package)
      fill_in 'Tracking number', with: '#3'
      uncheck 'Delivery status'
      click_button 'Update Package'
      expect(page).to have_content 'Package was successfully updated.'
      expect(page).to have_content '#3'
    end
  end

  context 'when delete an existing package' do
    let!(:package) { Package.create!(tracking_number: '#2', delivery_status: 'true', courier: courier) }
    it 'successfully deletes the package' do
      visit courier_path(courier)
      accept_confirm do
        click_link 'Delete'
      end
      expect(page).not_to have_content package.tracking_number
    end
  end
end
