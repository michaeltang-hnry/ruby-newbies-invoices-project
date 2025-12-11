class InvoicesController < ApplicationController
    layout "dashboard"
    def index
        @invoices = Invoice.order(created_at: :desc)
    end

    def show
        @invoice = Invoice.find_by!(identifier: params[identifier])
    end

    def new
        @invoice = Invoice.new
        @invoice.invoice_items.build
    end

    def create
        @invoice = Invoice.new(invoice_params)

        if @invoice.save
            redirect_to invoice_path(identifier: @invoice.identifier), notice: "Invoice created successfully."
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def invoice_params
        params.require(:invoice).permit(
            :client_id,
            :identifier,
            invoice_items_attributes: [ :description, :quantity, :per_cost, :_destroy ]
        )
    end
end
