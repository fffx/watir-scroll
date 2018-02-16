require "spec_helper"

describe Watir::Browser do
  describe "#scroll.to" do
    it "scrolls to the top of the page" do
      @browser.scroll.to :bottom
      @browser.scroll.to :top
      expect(visible?(@browser.button(text: 'Top'))).to eq(true)
      expect(visible?(@browser.button(text: 'Center'))).to eq(true)
      expect(visible?(@browser.button(text: 'Bottom'))).to eq(false)
    end

    it "scrolls to the center of the page" do
      @browser.scroll.to :center
      expect(visible?(@browser.button(text: 'Top'))).to eq(false)
      expect(visible?(@browser.button(text: 'Center'))).to eq(true)
      expect(visible?(@browser.button(text: 'Bottom'))).to eq(false)
    end

    it "scrolls to the bottom of the page" do
      @browser.scroll.to :bottom
      expect(visible?(@browser.button(text: 'Top'))).to eq(false)
      expect(visible?(@browser.button(text: 'Center'))).to eq(true)
      expect(visible?(@browser.button(text: 'Bottom'))).to eq(true)
    end

    it "scrolls to coordinates" do
      button = @browser.button(text: 'Bottom')
      @browser.scroll.to [button.wd.location.x, button.wd.location.y]
      expect(visible?(button)).to eq(true)
    end

    it "scrolls by offset" do
      button = @browser.button(text: 'Bottom')
      @browser.scroll.by(0, button.wd.location.y)
      expect(visible?(button)).to eq(true)
    end

    it "raises error when scroll point is not vaild" do
      expect { @browser.scroll.to(:blah) }.to raise_error(ArgumentError)
    end
  end
end
