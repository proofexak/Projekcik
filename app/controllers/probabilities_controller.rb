class ProbabilitiesController < ApplicationController
  before_action :set_probability, only: [:show, :edit, :update, :destroy]
  include ProbabilitiesHelper

  def index
    if current_user.probability == nil
      redirect_to new_probability_path
    else
      @probability = current_user.probability
      @chart = Fusioncharts::Chart.new({
      :height => 400,
      :width => 600,
      :id => 'chart',
      :type => 'column2d',
      :renderAt => 'chart-container',
      :dataSource => '{
          "chart": {
              "caption": "Monthly revenue for last year",
              "subCaption": "Harrys SuperMart",
              "xAxisName": "Month",
              "yAxisName": "Revenues (In USD)",
              "numberPrefix": "$",
              "theme": "zune"
          },
          "data": [{
              "label": "Jan",
              "value": "420000"
          }, {
              "label": "Feb",
              "value": "810000"
          }, {
              "label": "Mar",
              "value": "720000"
          }, {
              "label": "Apr",
              "value": "550000"
          }, {
              "label": "May",
              "value": "910000"
          }, {
              "label": "Jun",
              "value": "510000"
          }, {
              "label": "Jul",
              "value": "680000"
          }, {
              "label": "Aug",
              "value": "620000"
          }, {
              "label": "Sep",
              "value": "610000"
          }, {
              "label": "Oct",
              "value": "490000"
          }, {
              "label": "Nov",
              "value": "900000"
          }, {
              "label": "Dec",
              "value": "730000"
          }]
      }'
  })
    end
  end

  def fc_json
    @chart = Fusioncharts::Chart.new({
      :height => 400,
      :width => 600,
      :id => 'chart',
      :type => 'column2d',
      :renderAt => 'chart-container',
      :dataSource => '{
          "chart": {
              "caption": "Monthly revenue for last year",
              "subCaption": "Harrys SuperMart",
              "xAxisName": "Month",
              "yAxisName": "Revenues (In USD)",
              "numberPrefix": "$",
              "theme": "zune"
          },
          "data": [{
              "label": "Jan",
              "value": "420000"
          }, {
              "label": "Feb",
              "value": "810000"
          }, {
              "label": "Mar",
              "value": "720000"
          }, {
              "label": "Apr",
              "value": "550000"
          }, {
              "label": "May",
              "value": "910000"
          }, {
              "label": "Jun",
              "value": "510000"
          }, {
              "label": "Jul",
              "value": "680000"
          }, {
              "label": "Aug",
              "value": "620000"
          }, {
              "label": "Sep",
              "value": "610000"
          }, {
              "label": "Oct",
              "value": "490000"
          }, {
              "label": "Nov",
              "value": "900000"
          }, {
              "label": "Dec",
              "value": "730000"
          }]
      }'
  })
  end

  def new
    @probability = current_user.build_probability
    if @probability.save
      redirect_to probabilities_path, notice: 'Wszystko git'
    else
      redirect_to probabilities_path, notice: 'Wszystko źle'
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
    elsif @name == "Develompent points"
      @probability.development_points += 1
    elsif @name == "Diamonds"
      @probability.diamonds += 1
    end

    if @probability.save
      redirect_to probabilities_path, notice: 'Wszystko git'
    else
      redirect_to probabilities_path, notice: 'Wszystko źle'
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
    elsif @name == "Develompent points"
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
  end

end
