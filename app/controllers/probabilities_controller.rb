class ProbabilitiesController < ApplicationController
  before_action :authenticate_user!
  include ActionView::Helpers::NumberHelper
  include ProbabilitiesHelper

  def index
    if current_user.probability == nil
      redirect_to new_probability_path
    else
      @probability = current_user.probability
      @allprob = Probability.all
      @allpercentage = { "Gold" => 0, "Supply" => 0, "Medals" => 0, "Raw materials" => 0,
     "Development points" => 0, "Diamonds" => 0, "Total" => 0}
      all_percentage(@allprob, @allpercentage)
      @chart = Fusioncharts::Chart.new({
        :height => number_to_percentage(100),
        :width => number_to_percentage(100),
        :type => 'pie3d',
        :renderAt => 'chart-container',
        :dataSource => {
          :chart => {
                :caption => 'Your percentage probability for Hedge Maze',
                :xAxisname => 'Item',
                :yAxisName => 'Percentage (%)',
                :numberSuffix => '%',
                :theme => 'fint',
            },
              :data => [{
              "label": "Gold",
              "value": percentage("Gold", @probability)
          }, {
              "label": "Supply",
              "value": percentage("Supply", @probability)
          }, {
              "label": "Diamonds",
              "value": percentage("Diamonds", @probability)
          }, {
              "label": "Development points",
              "value": percentage("Development points", @probability)
          }, {
              "label": "Raw materials",
              "value": percentage("Raw materials", @probability)
          }, {
              "label": "Medals",
              "value": percentage("Medals", @probability)
          }]
          }
      })

    @chart2 = Fusioncharts::Chart.new({
        :height => number_to_percentage(100),
        :width => number_to_percentage(100),
        :type => 'pie3d',
        :renderAt => 'chart-container2',
        :dataSource => {
          :chart => {
                :caption => 'Percentage probability for Hedge Maze',
                :xAxisname => 'Item',
                :yAxisName => 'Percentage (%)',
                :numberSuffix => '%',
                :theme => 'fint',
            },
              :data => [{
                  "label": "Gold",
                  "value": @allpercentage["Gold"]
              }, {
                  "label": "Supply",
                  "value": @allpercentage["Supply"]
              }, {
                  "label": "Diamonds",
                  "value": @allpercentage["Diamonds"]
              }, {
                  "label": "Development points",
                  "value": @allpercentage["Development points"]
              }, {
                  "label": "Raw materials",
                  "value": @allpercentage["Raw materials"]
              }, {
                  "label": "Medals",
                  "value": @allpercentage["Medals"]
              }]
          }
      })
    end
  end

  def new
    @probability = current_user.build_probability
    if @probability.save
      redirect_to probabilities_path, notice: 'Probability created.'
    else
      redirect_to probabilities_path, notice: 'Probability wasnt created.'
    end
  end

  def add_quant
    @name = params[:name]
    @probability = current_user.probability
    if @name == "Gold"
      @probability.gold += 1
    elsif @name == "Medals"
      @probability.medals += 1
    elsif @name == "Supply"
      @probability.supply += 1
    elsif @name == "Raw materials"
      @probability.raws += 1
    elsif @name == "Development points"
      @probability.development_points += 1
    elsif @name == "Diamonds"
      @probability.diamonds += 1
    end

    if @probability.save
      redirect_to probabilities_path, notice: 'Probability updated'
    else
      redirect_to probabilities_path, notice: 'Probability not updated.'
    end
  end

  def subtract_quant
    @name = params[:name]
    @probability = current_user.probability
    if @name == "Gold"
      if @probability.gold > 0
        @probability.gold -= 1
      end
    elsif @name == "Medals"
      if @probability.medals > 0
        @probability.medals -= 1
      end
    elsif @name == "Supply"
      if @probability.supply > 0
        @probability.supply -= 1
      end
    elsif @name == "Raw materials"
      if @probability.raws > 0
        @probability.raws -= 1
      end
    elsif @name == "Development points"
      if @probability.development_points > 0
        @probability.development_points -= 1
      end
    elsif @name == "Diamonds"
      if @probability.diamonds > 0
        @probability.diamonds -= 1
      end
    end

    if @probability.save
      redirect_to probabilities_path, notice: 'Wszystko git'
    else
      redirect_to probabilities_path, notice: 'Wszystko źle'
    end
  end

  def destroy
    @probability = current_user.probability
    @probability.destroy
    redirect_to root_path, notice: 'Destroyed probability'
  end

end
