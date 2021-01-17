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

  context 'when record match' do
    context 'searching values' do
      let(:searching_values) do
        ['Common']
      end

      it '#call method return true' do
        expect(subject.call(searching_values)).to eq true
      end
    end

    context 'searching values' do
      let(:searching_values) do
        %w[Lisp Common]
      end

      it '#call method return true' do
        expect(subject.call(searching_values)).to eq true
      end
    end

    context 'searching values' do
      let(:searching_values) do
        %w[Interactive Lisp Common]
      end

      it '#call method return true' do
        expect(subject.call(searching_values)).to eq true
      end
    end
  end

  context "when record didn't match" do
    context 'searching values' do
      let(:searching_values) do
        ['ECMAScript']
      end

      it '#call method return false' do
        expect(subject.call(searching_values)).to eq false
      end
    end

    context 'searching values' do
      let(:searching_values) do
        %w[ECMAScript Scripting]
      end

      it '#call method return false' do
        expect(subject.call(searching_values)).to eq false
      end
    end
  end
end
