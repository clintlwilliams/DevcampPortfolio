# frozen_string_literal: true

module Homebrew
  module Fetch
    module_function

    def fetch_bottle?(f)
      return true if Homebrew.args.force_bottle && f.bottle
      return false unless f.bottle && f.pour_bottle?
      return false if Homebrew.args.build_formula_from_source?(f)
      return false unless f.bottle.compatible_cellar?

      true
    end
  end
end
