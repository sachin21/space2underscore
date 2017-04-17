# frozen_string_literal: true

require 'spec_helper'
require 'open3'

describe Space2underscore do
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

  let(:branch_name) { 'foo_bar' }
  let(:hidden) { '&> /dev/null' }

  describe '.convert' do
    subject { Space2underscore.convert(argument) }

    context 'when number of argument is one' do
      let(:argument) { ['foo bar'] }

      it { is_expected.to include('_') }
    end

    context 'when number of argument is many' do
      let(:argument) { %w(foo bar) }

      it { is_expected.to include('_') }
    end
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

    it 'creates a new branch' do
      expect(Space2underscore.create_new_branch(branch_name)).to be true
    end
  end

  describe '.usage' do
    subject { Space2underscore.usage }

    it { is_expected.to be_a String }
    it { is_expected.not_to be_empty }
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
