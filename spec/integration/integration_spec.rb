require 'rails_helper'

RSpec.describe 'IndexRecipes', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = User.new(name: 'Andres', email: 'a@mail.com', password: '123456')
    @user.save
    @group = Group.create(user_id: @user.id, name: 'Travel', icon: 'https://cdn-icons-png.flaticon.com/512/3663/3663544.png')
    sign_in(@user)
  end

  it 'Takes user to the splash page' do
    visit '/'
    expect(page.body).to include('i-expense')
  end

  it 'Shows categories button' do
    visit '/'
    expect(page.body).to include('See Categories')
  end

  it 'shows log out btn' do
    visit '/'
    expect(page.body).to include('Logout')
  end

  it 'Shows saved Group and categories page' do
    visit '/'
    click_on('See Categories')
    expect(page.body).to include('Categories')
    expect(page.body).to include('Travel')
    expect(page.body).to include('See expenses')
  end

  it 'Categories page takes the user to expenses page' do
    visit '/'
    click_on('See Categories')
    click_on('See expenses')
    expect(page.body).to include('Travel')
    expect(page.body).to include('Expenses')
  end

  it 'Shows form to add categories' do
    visit '/'
    click_on('See Categories')
    click_on('Add Category')
    expect(page.body).to include('New group')
    click_on('Back to groups')
    expect(page.body).to include('Categories')
  end

  it 'Expenses page takes the user to create expense page' do
    visit '/'
    click_on('See Categories')
    click_on('See expenses')
    click_on('New expense')
    expect(page.body).to include('New expense')
  end
end
