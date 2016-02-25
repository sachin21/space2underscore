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
    execute_command('git checkout master')
  end

  def delete_branch
    execute_command("git branch -D #{branch_name}")
  end

  def create_branch
    execute_command("git branch #{branch_name}")
  end

  def execute_command(command)
    system("#{command} #{hidden}")
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
      expect(Space2underscore.create_new_branch(branch_name)).to eq true
    end
  end

  describe '.usage' do
    it 'returns String class' do
      expect(Space2underscore.usage).to be_a(String)
    end

    it 'does not return an blank string does' do
      expect(Space2underscore.usage).not_to be_nil
    end
  end
end
