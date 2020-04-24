require 'journey'
require 'station'

describe Journey do
  let(:entrystation) {Station.new('london', 1)}
  let(:exitstation) {Station.new('Turkey', 2)}

  it 'gets true if the journey is completed' do
    subject.starting(entrystation)
    subject.finishing(exitstation)
    expect(subject.complete?).to eq true
  end

   it 'remembers the entry station' do
     subject.starting(entrystation.name)
     expect(subject.journeys[:entry_station]).to eq entrystation.name
   end

   it 'remembers the exit station' do
     subject.finishing(exitstation.name)
     expect(subject.journeys[:exit_station]).to eq exitstation.name
   end

   context 'if there was no entry station' do
      it 'charges penalty' do
        subject.finishing(exitstation)
        expect(subject.fare).to eq Journey::PENALTY
   end
end


end
