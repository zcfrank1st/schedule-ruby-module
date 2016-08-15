require 'bundler/inline'
def need (gems)
  current_gems = `gem list --no-version --no-verbos`
  gems_array = current_gems.split("\n")

  need_to_install_gems = gems - (gems_array & gems)
  puts need_to_install_gems.to_s

  unless need_to_install_gems.empty?
    gemfile true do
      source 'https://gems.ruby-china.org/'
      need_to_install_gems.each do |ele|
        gem ele
      end
    end
  end
end