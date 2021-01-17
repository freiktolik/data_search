# frozen_string_literal: true

describe ProgrammingLanguage do
  let(:programming_language) do
    {
      'Name' => 'Common Lisp',
      'Type' => 'Compiled, Interactive mode, Object-oriented class-based, Reflective',
      'Designed by' => 'Scott Fahlman, Richard P. Gabriel, Dave Moon, Guy Steele, Dan Weinreb'
    }
  end

  subject do
    described_class.new(programming_language)
  end

  describe 'when record match' do
    shared_examples '#call method return true' do
      it { expect(subject.call(searching_values)).to eq true }
    end

    context 'searching values' do
      let(:searching_values) do
        ['Common']
      end

      it_behaves_like '#call method return true'
    end

    context 'searching values' do
      let(:searching_values) do
        %w[Lisp Common]
      end

      it_behaves_like '#call method return true'
    end

    context 'searching values' do
      let(:searching_values) do
        %w[Interactive Lisp Common]
      end

      it_behaves_like '#call method return true'
    end
  end

  describe "when record didn't match" do
    shared_examples '#call method return false' do
      it { expect(subject.call(searching_values)).to eq false }
    end

    context 'searching values' do
      let(:searching_values) do
        ['ECMAScript']
      end

      it_behaves_like '#call method return false'
    end

    context 'searching values' do
      let(:searching_values) do
        %w[ECMAScript Scripting]
      end

      it_behaves_like '#call method return false'
    end
  end
end
