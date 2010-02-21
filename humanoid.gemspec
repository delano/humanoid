# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{humanoid}
  s.version = "1.2.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Durran Jordan"]
  s.date = %q{2010-02-20}
  s.email = %q{durran@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     ".watchr",
     "HISTORY",
     "MIT_LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "caliper.yml",
     "humanoid.gemspec",
     "lib/humanoid.rb",
     "lib/humanoid/associations.rb",
     "lib/humanoid/associations/belongs_to.rb",
     "lib/humanoid/associations/belongs_to_related.rb",
     "lib/humanoid/associations/has_many.rb",
     "lib/humanoid/associations/has_many_related.rb",
     "lib/humanoid/associations/has_one.rb",
     "lib/humanoid/associations/has_one_related.rb",
     "lib/humanoid/associations/options.rb",
     "lib/humanoid/associations/proxy.rb",
     "lib/humanoid/attributes.rb",
     "lib/humanoid/callbacks.rb",
     "lib/humanoid/collection.rb",
     "lib/humanoid/collections/cyclic_iterator.rb",
     "lib/humanoid/collections/master.rb",
     "lib/humanoid/collections/mimic.rb",
     "lib/humanoid/collections/operations.rb",
     "lib/humanoid/collections/slaves.rb",
     "lib/humanoid/commands.rb",
     "lib/humanoid/commands/create.rb",
     "lib/humanoid/commands/delete.rb",
     "lib/humanoid/commands/delete_all.rb",
     "lib/humanoid/commands/deletion.rb",
     "lib/humanoid/commands/destroy.rb",
     "lib/humanoid/commands/destroy_all.rb",
     "lib/humanoid/commands/save.rb",
     "lib/humanoid/components.rb",
     "lib/humanoid/config.rb",
     "lib/humanoid/contexts.rb",
     "lib/humanoid/contexts/enumerable.rb",
     "lib/humanoid/contexts/ids.rb",
     "lib/humanoid/contexts/mongo.rb",
     "lib/humanoid/contexts/paging.rb",
     "lib/humanoid/criteria.rb",
     "lib/humanoid/criterion/complex.rb",
     "lib/humanoid/criterion/exclusion.rb",
     "lib/humanoid/criterion/inclusion.rb",
     "lib/humanoid/criterion/optional.rb",
     "lib/humanoid/cursor.rb",
     "lib/humanoid/document.rb",
     "lib/humanoid/enslavement.rb",
     "lib/humanoid/errors.rb",
     "lib/humanoid/extensions.rb",
     "lib/humanoid/extensions/array/accessors.rb",
     "lib/humanoid/extensions/array/aliasing.rb",
     "lib/humanoid/extensions/array/assimilation.rb",
     "lib/humanoid/extensions/array/conversions.rb",
     "lib/humanoid/extensions/array/parentization.rb",
     "lib/humanoid/extensions/boolean/conversions.rb",
     "lib/humanoid/extensions/date/conversions.rb",
     "lib/humanoid/extensions/datetime/conversions.rb",
     "lib/humanoid/extensions/float/conversions.rb",
     "lib/humanoid/extensions/hash/accessors.rb",
     "lib/humanoid/extensions/hash/assimilation.rb",
     "lib/humanoid/extensions/hash/conversions.rb",
     "lib/humanoid/extensions/hash/criteria_helpers.rb",
     "lib/humanoid/extensions/hash/scoping.rb",
     "lib/humanoid/extensions/integer/conversions.rb",
     "lib/humanoid/extensions/nil/assimilation.rb",
     "lib/humanoid/extensions/object/conversions.rb",
     "lib/humanoid/extensions/proc/scoping.rb",
     "lib/humanoid/extensions/string/conversions.rb",
     "lib/humanoid/extensions/string/inflections.rb",
     "lib/humanoid/extensions/symbol/inflections.rb",
     "lib/humanoid/extensions/time/conversions.rb",
     "lib/humanoid/factory.rb",
     "lib/humanoid/field.rb",
     "lib/humanoid/fields.rb",
     "lib/humanoid/finders.rb",
     "lib/humanoid/identity.rb",
     "lib/humanoid/indexes.rb",
     "lib/humanoid/matchers.rb",
     "lib/humanoid/matchers/all.rb",
     "lib/humanoid/matchers/default.rb",
     "lib/humanoid/matchers/exists.rb",
     "lib/humanoid/matchers/gt.rb",
     "lib/humanoid/matchers/gte.rb",
     "lib/humanoid/matchers/in.rb",
     "lib/humanoid/matchers/lt.rb",
     "lib/humanoid/matchers/lte.rb",
     "lib/humanoid/matchers/ne.rb",
     "lib/humanoid/matchers/nin.rb",
     "lib/humanoid/matchers/size.rb",
     "lib/humanoid/memoization.rb",
     "lib/humanoid/named_scope.rb",
     "lib/humanoid/scope.rb",
     "lib/humanoid/timestamps.rb",
     "lib/humanoid/versioning.rb",
     "perf/benchmark.rb",
     "spec/integration/humanoid/associations_spec.rb",
     "spec/integration/humanoid/attributes_spec.rb",
     "spec/integration/humanoid/commands_spec.rb",
     "spec/integration/humanoid/contexts/enumerable_spec.rb",
     "spec/integration/humanoid/criteria_spec.rb",
     "spec/integration/humanoid/document_spec.rb",
     "spec/integration/humanoid/extensions_spec.rb",
     "spec/integration/humanoid/finders_spec.rb",
     "spec/integration/humanoid/inheritance_spec.rb",
     "spec/integration/humanoid/named_scope_spec.rb",
     "spec/models/address.rb",
     "spec/models/animal.rb",
     "spec/models/comment.rb",
     "spec/models/country_code.rb",
     "spec/models/employer.rb",
     "spec/models/game.rb",
     "spec/models/inheritance.rb",
     "spec/models/location.rb",
     "spec/models/mixed_drink.rb",
     "spec/models/name.rb",
     "spec/models/namespacing.rb",
     "spec/models/patient.rb",
     "spec/models/person.rb",
     "spec/models/pet.rb",
     "spec/models/pet_owner.rb",
     "spec/models/phone.rb",
     "spec/models/post.rb",
     "spec/models/translation.rb",
     "spec/models/vet_visit.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/unit/mongoid/associations/belongs_to_related_spec.rb",
     "spec/unit/mongoid/associations/belongs_to_spec.rb",
     "spec/unit/mongoid/associations/has_many_related_spec.rb",
     "spec/unit/mongoid/associations/has_many_spec.rb",
     "spec/unit/mongoid/associations/has_one_related_spec.rb",
     "spec/unit/mongoid/associations/has_one_spec.rb",
     "spec/unit/mongoid/associations/options_spec.rb",
     "spec/unit/mongoid/associations_spec.rb",
     "spec/unit/mongoid/attributes_spec.rb",
     "spec/unit/mongoid/callbacks_spec.rb",
     "spec/unit/mongoid/collection_spec.rb",
     "spec/unit/mongoid/collections/cyclic_iterator_spec.rb",
     "spec/unit/mongoid/collections/master_spec.rb",
     "spec/unit/mongoid/collections/mimic_spec.rb",
     "spec/unit/mongoid/collections/slaves_spec.rb",
     "spec/unit/mongoid/commands/create_spec.rb",
     "spec/unit/mongoid/commands/delete_all_spec.rb",
     "spec/unit/mongoid/commands/delete_spec.rb",
     "spec/unit/mongoid/commands/destroy_all_spec.rb",
     "spec/unit/mongoid/commands/destroy_spec.rb",
     "spec/unit/mongoid/commands/save_spec.rb",
     "spec/unit/mongoid/commands_spec.rb",
     "spec/unit/mongoid/config_spec.rb",
     "spec/unit/mongoid/contexts/enumerable_spec.rb",
     "spec/unit/mongoid/contexts/mongo_spec.rb",
     "spec/unit/mongoid/contexts_spec.rb",
     "spec/unit/mongoid/criteria_spec.rb",
     "spec/unit/mongoid/criterion/complex_spec.rb",
     "spec/unit/mongoid/criterion/exclusion_spec.rb",
     "spec/unit/mongoid/criterion/inclusion_spec.rb",
     "spec/unit/mongoid/criterion/optional_spec.rb",
     "spec/unit/mongoid/cursor_spec.rb",
     "spec/unit/mongoid/document_spec.rb",
     "spec/unit/mongoid/enslavement_spec.rb",
     "spec/unit/mongoid/errors_spec.rb",
     "spec/unit/mongoid/extensions/array/accessors_spec.rb",
     "spec/unit/mongoid/extensions/array/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/array/conversions_spec.rb",
     "spec/unit/mongoid/extensions/array/parentization_spec.rb",
     "spec/unit/mongoid/extensions/boolean/conversions_spec.rb",
     "spec/unit/mongoid/extensions/date/conversions_spec.rb",
     "spec/unit/mongoid/extensions/datetime/conversions_spec.rb",
     "spec/unit/mongoid/extensions/float/conversions_spec.rb",
     "spec/unit/mongoid/extensions/hash/accessors_spec.rb",
     "spec/unit/mongoid/extensions/hash/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/hash/conversions_spec.rb",
     "spec/unit/mongoid/extensions/hash/criteria_helpers_spec.rb",
     "spec/unit/mongoid/extensions/hash/scoping_spec.rb",
     "spec/unit/mongoid/extensions/integer/conversions_spec.rb",
     "spec/unit/mongoid/extensions/nil/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/object/conversions_spec.rb",
     "spec/unit/mongoid/extensions/proc/scoping_spec.rb",
     "spec/unit/mongoid/extensions/string/conversions_spec.rb",
     "spec/unit/mongoid/extensions/string/inflections_spec.rb",
     "spec/unit/mongoid/extensions/symbol/inflections_spec.rb",
     "spec/unit/mongoid/extensions/time/conversions_spec.rb",
     "spec/unit/mongoid/factory_spec.rb",
     "spec/unit/mongoid/field_spec.rb",
     "spec/unit/mongoid/fields_spec.rb",
     "spec/unit/mongoid/finders_spec.rb",
     "spec/unit/mongoid/identity_spec.rb",
     "spec/unit/mongoid/indexes_spec.rb",
     "spec/unit/mongoid/matchers/all_spec.rb",
     "spec/unit/mongoid/matchers/default_spec.rb",
     "spec/unit/mongoid/matchers/exists_spec.rb",
     "spec/unit/mongoid/matchers/gt_spec.rb",
     "spec/unit/mongoid/matchers/gte_spec.rb",
     "spec/unit/mongoid/matchers/in_spec.rb",
     "spec/unit/mongoid/matchers/lt_spec.rb",
     "spec/unit/mongoid/matchers/lte_spec.rb",
     "spec/unit/mongoid/matchers/ne_spec.rb",
     "spec/unit/mongoid/matchers/nin_spec.rb",
     "spec/unit/mongoid/matchers/size_spec.rb",
     "spec/unit/mongoid/matchers_spec.rb",
     "spec/unit/mongoid/memoization_spec.rb",
     "spec/unit/mongoid/named_scope_spec.rb",
     "spec/unit/mongoid/scope_spec.rb",
     "spec/unit/mongoid/timestamps_spec.rb",
     "spec/unit/mongoid/versioning_spec.rb",
     "spec/unit/mongoid_spec.rb"
  ]
  s.homepage = %q{http://mongoid.org}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A mirror of Mongoid (an awesome Ruby ODM framework for MongoDB) with a name I can say out loud.}
  s.test_files = [
    "spec/integration/humanoid/associations_spec.rb",
     "spec/integration/humanoid/attributes_spec.rb",
     "spec/integration/humanoid/commands_spec.rb",
     "spec/integration/humanoid/contexts/enumerable_spec.rb",
     "spec/integration/humanoid/criteria_spec.rb",
     "spec/integration/humanoid/document_spec.rb",
     "spec/integration/humanoid/extensions_spec.rb",
     "spec/integration/humanoid/finders_spec.rb",
     "spec/integration/humanoid/inheritance_spec.rb",
     "spec/integration/humanoid/named_scope_spec.rb",
     "spec/models/address.rb",
     "spec/models/animal.rb",
     "spec/models/comment.rb",
     "spec/models/country_code.rb",
     "spec/models/employer.rb",
     "spec/models/game.rb",
     "spec/models/inheritance.rb",
     "spec/models/location.rb",
     "spec/models/mixed_drink.rb",
     "spec/models/name.rb",
     "spec/models/namespacing.rb",
     "spec/models/patient.rb",
     "spec/models/person.rb",
     "spec/models/pet.rb",
     "spec/models/pet_owner.rb",
     "spec/models/phone.rb",
     "spec/models/post.rb",
     "spec/models/translation.rb",
     "spec/models/vet_visit.rb",
     "spec/spec_helper.rb",
     "spec/unit/mongoid/associations/belongs_to_related_spec.rb",
     "spec/unit/mongoid/associations/belongs_to_spec.rb",
     "spec/unit/mongoid/associations/has_many_related_spec.rb",
     "spec/unit/mongoid/associations/has_many_spec.rb",
     "spec/unit/mongoid/associations/has_one_related_spec.rb",
     "spec/unit/mongoid/associations/has_one_spec.rb",
     "spec/unit/mongoid/associations/options_spec.rb",
     "spec/unit/mongoid/associations_spec.rb",
     "spec/unit/mongoid/attributes_spec.rb",
     "spec/unit/mongoid/callbacks_spec.rb",
     "spec/unit/mongoid/collection_spec.rb",
     "spec/unit/mongoid/collections/cyclic_iterator_spec.rb",
     "spec/unit/mongoid/collections/master_spec.rb",
     "spec/unit/mongoid/collections/mimic_spec.rb",
     "spec/unit/mongoid/collections/slaves_spec.rb",
     "spec/unit/mongoid/commands/create_spec.rb",
     "spec/unit/mongoid/commands/delete_all_spec.rb",
     "spec/unit/mongoid/commands/delete_spec.rb",
     "spec/unit/mongoid/commands/destroy_all_spec.rb",
     "spec/unit/mongoid/commands/destroy_spec.rb",
     "spec/unit/mongoid/commands/save_spec.rb",
     "spec/unit/mongoid/commands_spec.rb",
     "spec/unit/mongoid/config_spec.rb",
     "spec/unit/mongoid/contexts/enumerable_spec.rb",
     "spec/unit/mongoid/contexts/mongo_spec.rb",
     "spec/unit/mongoid/contexts_spec.rb",
     "spec/unit/mongoid/criteria_spec.rb",
     "spec/unit/mongoid/criterion/complex_spec.rb",
     "spec/unit/mongoid/criterion/exclusion_spec.rb",
     "spec/unit/mongoid/criterion/inclusion_spec.rb",
     "spec/unit/mongoid/criterion/optional_spec.rb",
     "spec/unit/mongoid/cursor_spec.rb",
     "spec/unit/mongoid/document_spec.rb",
     "spec/unit/mongoid/enslavement_spec.rb",
     "spec/unit/mongoid/errors_spec.rb",
     "spec/unit/mongoid/extensions/array/accessors_spec.rb",
     "spec/unit/mongoid/extensions/array/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/array/conversions_spec.rb",
     "spec/unit/mongoid/extensions/array/parentization_spec.rb",
     "spec/unit/mongoid/extensions/boolean/conversions_spec.rb",
     "spec/unit/mongoid/extensions/date/conversions_spec.rb",
     "spec/unit/mongoid/extensions/datetime/conversions_spec.rb",
     "spec/unit/mongoid/extensions/float/conversions_spec.rb",
     "spec/unit/mongoid/extensions/hash/accessors_spec.rb",
     "spec/unit/mongoid/extensions/hash/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/hash/conversions_spec.rb",
     "spec/unit/mongoid/extensions/hash/criteria_helpers_spec.rb",
     "spec/unit/mongoid/extensions/hash/scoping_spec.rb",
     "spec/unit/mongoid/extensions/integer/conversions_spec.rb",
     "spec/unit/mongoid/extensions/nil/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/object/conversions_spec.rb",
     "spec/unit/mongoid/extensions/proc/scoping_spec.rb",
     "spec/unit/mongoid/extensions/string/conversions_spec.rb",
     "spec/unit/mongoid/extensions/string/inflections_spec.rb",
     "spec/unit/mongoid/extensions/symbol/inflections_spec.rb",
     "spec/unit/mongoid/extensions/time/conversions_spec.rb",
     "spec/unit/mongoid/factory_spec.rb",
     "spec/unit/mongoid/field_spec.rb",
     "spec/unit/mongoid/fields_spec.rb",
     "spec/unit/mongoid/finders_spec.rb",
     "spec/unit/mongoid/identity_spec.rb",
     "spec/unit/mongoid/indexes_spec.rb",
     "spec/unit/mongoid/matchers/all_spec.rb",
     "spec/unit/mongoid/matchers/default_spec.rb",
     "spec/unit/mongoid/matchers/exists_spec.rb",
     "spec/unit/mongoid/matchers/gt_spec.rb",
     "spec/unit/mongoid/matchers/gte_spec.rb",
     "spec/unit/mongoid/matchers/in_spec.rb",
     "spec/unit/mongoid/matchers/lt_spec.rb",
     "spec/unit/mongoid/matchers/lte_spec.rb",
     "spec/unit/mongoid/matchers/ne_spec.rb",
     "spec/unit/mongoid/matchers/nin_spec.rb",
     "spec/unit/mongoid/matchers/size_spec.rb",
     "spec/unit/mongoid/matchers_spec.rb",
     "spec/unit/mongoid/memoization_spec.rb",
     "spec/unit/mongoid/named_scope_spec.rb",
     "spec/unit/mongoid/scope_spec.rb",
     "spec/unit/mongoid/timestamps_spec.rb",
     "spec/unit/mongoid/versioning_spec.rb",
     "spec/unit/mongoid_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["<= 2.3.5"])
      s.add_runtime_dependency(%q<mongo>, [">= 0.18.3"])
      s.add_runtime_dependency(%q<durran-validatable>, [">= 2.0.1"])
      s.add_runtime_dependency(%q<will_paginate>, ["< 3.0.pre"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.8"])
    else
      s.add_dependency(%q<activesupport>, ["<= 2.3.5"])
      s.add_dependency(%q<mongo>, [">= 0.18.3"])
      s.add_dependency(%q<durran-validatable>, [">= 2.0.1"])
      s.add_dependency(%q<will_paginate>, ["< 3.0.pre"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<mocha>, [">= 0.9.8"])
    end
  else
    s.add_dependency(%q<activesupport>, ["<= 2.3.5"])
    s.add_dependency(%q<mongo>, [">= 0.18.3"])
    s.add_dependency(%q<durran-validatable>, [">= 2.0.1"])
    s.add_dependency(%q<will_paginate>, ["< 3.0.pre"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<mocha>, [">= 0.9.8"])
  end
end
