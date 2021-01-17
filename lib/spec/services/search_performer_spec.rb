# frozen_string_literal: true

describe SearchPerformer do
  let(:data_hashes) do
    [
      {
        'Name' => 'Ruby',
        'Type' => 'Imperative, Interpreted, Metaprogramming, Reflective, Scripting, Interactive mode',
        'Designed by' => 'Yukihiro Matsumoto'
      },
      {
        'Name' => 'BASIC',
        'Type' => 'Imperative, Compiled, Procedural, Interactive mode, Interpreted',
        'Designed by' => 'John George Kemeny, Thomas Eugene Kurtz'
      },
      {
        'Name' => 'Common Lisp',
        'Type' => 'Compiled, Interactive mode, Object-oriented class-based, Reflective',
        'Designed by' => 'Scott Fahlman, Richard P. Gabriel, Dave Moon, Guy Steele, Dan Weinreb'
      }
    ]
  end

  subject do
    described_class.new(Database.new(data_hashes))
  end

  context 'when record match' do
    context 'searching values' do
      let(:searching_values) do
        ['Interpreted']
      end

      let(:finding_data) do
        [
          {
            'Name' => 'Ruby',
            'Type' => 'Imperative, Interpreted, Metaprogramming, Reflective, Scripting, Interactive mode',
            'Designed by' => 'Yukihiro Matsumoto'
          },
          {
            'Name' => 'BASIC',
            'Type' => 'Imperative, Compiled, Procedural, Interactive mode, Interpreted',
            'Designed by' => 'John George Kemeny, Thomas Eugene Kurtz'
          }
        ]
      end

      it '#find_data should returns two records' do
        expect(subject.find_data(searching_values).count).to eq 2
      end

      it '#find_data should returns' do
        expect(subject.find_data(searching_values)).to eq finding_data
      end
    end

    context 'searching values' do
      let(:searching_values) do
        ['Interpreted', 'Thomas Eugene']
      end

      let(:finding_data) do
        [
          {
            'Name' => 'BASIC',
            'Type' => 'Imperative, Compiled, Procedural, Interactive mode, Interpreted',
            'Designed by' => 'John George Kemeny, Thomas Eugene Kurtz'
          }
        ]
      end

      it '#find_data should returns one record' do
        expect(subject.find_data(searching_values).count).to eq 1
      end

      it '#find_data should returns' do
        expect(subject.find_data(searching_values)).to eq finding_data
      end
    end
  end

  context "when record doesn't match" do
    context 'searching values' do
      let(:searching_values) do
        ['John Doe']
      end

      let(:finding_data) do
        []
      end

      it "#find_data shouldn't returns record" do
        expect(subject.find_data(searching_values).count).to eq 0
      end

      it '#find_data should returns empty array' do
        expect(subject.find_data(searching_values)).to eq finding_data
      end
    end
  end
end
