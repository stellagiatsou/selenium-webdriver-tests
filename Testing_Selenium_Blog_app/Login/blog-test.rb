require "selenium-webdriver"
require "rspec"

# TEST: Log in for blog
describe "Blog application" do
  describe "Login to the blog application" do
    it "confirm that a user can successfully login" do
      driver = Selenium::WebDriver.for :firefox
  		# Go to signup form
  		driver.navigate.to "https://selenium-blog.herokuapp.com/login"
  		# Fill out and submit form

  		email_field = driver.find_element(id: 'session_email')
  		email_field.send_keys("sgiatsou@test.com")

  		password_field = driver.find_element(id: 'session_password')
  		password_field.send_keys("password")

      #log_in_button = driver.findElement(By.name("commit"))
      login_button = driver.find_element(name: 'commit')
      login_button.click
  		#log_in_button = driver.find_element(id: '')
  		#log_in_button.click

  		# Confirm user is signed up successfully
  		banner = driver.find_element(id: 'flash_success')
  		banner_text = banner.text
  		expect(banner_text).to eq("You have successfully logged in!")

  		driver.quit
	  end
  end
end
