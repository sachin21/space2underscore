# coding: utf-8

require 'spec_helper'

describe Space2underscore do
  let(:branch_name) { 'foo_bar' }
  let(:hidden) { '&> /dev/null' }

  describe '.convert' do
    it 'returns underscore included in string' do
      expect(Space2underscore.convert(['foo bar'])).to include('_')
      expect(Space2underscore.convert(%w(foo bar))).to include('_')
    end
  end

  def checkout_master
    system("git checkout master #{hidden}")
  end

  def delete_branch
    system("git branch -D #{branch_name} #{hidden}")
  end

  def create_branch
    system("git branch #{branch_name} #{hidden}")
  end

  describe '.create_new_branch' do
    before do
      checkout_master
      delete_branch
    end

    after do
      checkout_master
      delete_branch
    end

    it 'creates the new branch' do
      expect(Space2underscore.create_new_branch(branch_name)).to be_truthy
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
