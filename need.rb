require 'bundler/inline'
def NEED (gems)
  current_gems = `gem list --no-version --no-verbos`
  gems_array = current_gems.split("\n")

  need_to_install_gems = gems - (gems_array & gems)

  unless need_to_install_gems.empty?
    gemfile true do
      source 'https://gems.ruby-china.org/'
      need_to_install_gems.each do |ele|
        gem ele
      end
    end
  end
end


# for test
#NEED(['rainbow', 'chronic'])
#require 'rainbow'
#require 'chronic'

#puts Rainbow("this is red").red + " and " + Rainbow("this on yellow bg").bg(:yellow)

#puts Chronic.parse('tomorrow')
