require "spec_helper"

RSpec.describe SARVEvents do
  it "has a version number." do
    expect(SARVEvents::VERSION).not_to be nil
  end

  context "#parse" do
    it "should raise when invalid file path." do
      expect { SARVEvents.parse(file_fixture("unknown.xml")) }.to raise_error("unknown.xml is not a file or does not exist.")
    end

    it "should raise when invalid xml content." do
      expect { SARVEvents.parse(file_fixture("empty.xml")) }.to raise_error("empty.xml is not a valid xml file (unable to parse).")
    end

    it "should raise when no recording key." do
      expect { SARVEvents.parse(file_fixture("no_key.xml")) }.to raise_error("no_key.xml is missing recording key.")
    end

    it "should return SARVEvents::Recording when valid xml content but no events." do
      sample_no_events = SARVEvents.parse(file_fixture("sample_no_events.xml"))
      expect(sample_no_events).to be_an_instance_of(SARVEvents::Recording)
    end

    it "should return SARVEvents::Recording." do
      expect(@sample).to be_an_instance_of(SARVEvents::Recording)
    end
  end
end
