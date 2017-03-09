# frozen_string_literal: true

require 'spec_helper'
require 'open3'

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

  describe 'bin' do
    let(:argument1) { 'hoge' }
    let(:argument2) { 'fuga' }
    let(:result) { Open3.capture2(bin, argument1, argument2) }
    subject(:output) { result[0] }
    subject(:status) { result[1] }

    shared_examples_for 'output' do
      it 'returns underscore included in string' do
        expect(output).to eq "hoge_fuga\n"
      end
    end

    shared_examples_for 'status' do
      it 'returns underscore included in string' do
        expect(status.success?).to be true
      end
    end

    context 'with Space2underscore' do
      let(:bin) { File.join('bin', 's2u') }

      it_behaves_like 'output'
      it_behaves_like 'status'
    end
    context 'with s2u' do
      let(:bin) { File.join('bin', 'space2underscore') }

      it_behaves_like 'output'
      it_behaves_like 'status'
    end
  end
end
