require 'spec_helper'

describe Space2underscore do
  let(:branch_name) { 'foo_bar' }
  let(:hidden) { '> /dev/null 2>&1'}

  describe '.convert' do
    it 'returns underscore included in string' do
      expect(Space2underscore.convert(['foo bar'])).to include(branch_name)
      expect(Space2underscore.convert(%w(foo bar))).to include(branch_name)
    end
  end

  def checkout_and_remove_branch
    checkout_master = "git checkout master #{hidden}"
    delete_branch = "git branch -D #{branch_name} #{hidden}"

    system("#{checkout_master}; #{delete_branch}")
  end

  def create_branch
    system("git branch #{branch_name} #{hidden}")
  end

  describe '.create_new_branch' do
    after { checkout_and_remove_branch }

    context "when exist a git repository" do
      before { checkout_and_remove_branch }

      it 'creates the new branch' do
        expect(Space2underscore.create_new_branch(branch_name)).to be_truthy
      end
    end

    context "when exist a git repository" do
      before { create_branch }

      it 'creates the new branch' do
        expect(Space2underscore.create_new_branch(branch_name)).to be_falsey
      end
    end
  end

  describe '.usage' do
    it 'returns string' do
      expect(Space2underscore.usage).to be_a(String)
    end

    it 'does not return an blank string does' do
      expect(Space2underscore.usage).not_to be_nil
    end
  end
end
