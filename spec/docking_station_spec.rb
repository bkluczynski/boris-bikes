require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it 'releases working bikes' do
    subject.dock_bike(Bike.new)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock_bike(bike)
    # Again, we need to return the bike we just docked
    expect(subject.bike).to eq bike
  end

  describe '#release_bike' do

    it 'releases a bike' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike).to eq bike
    end

    it 'raises an error when station is new' do
      expect { subject.release_bike }.to raise_error ("Sorry, there are no bikes")
    end

  end

  describe '#dock_bike' do

    bike = Bike.new

    it 'docks something' do
      expect(subject.dock_bike(bike)).to eq bike
    end

    it 'raises an error when a bike is already docked' do
      subject.dock_bike(bike)
      expect { subject.dock_bike(bike) }.to raise_error("Sorry, another bike already docked")
    end

  end

end
