class QgsLayerPropertiesWidget : QgsPanelWidget
{
%TypeHeaderCode
#include <qgslayerpropertieswidget.h>
%End

  public:
    QgsLayerPropertiesWidget( QgsSymbolLayer* layer, const QgsSymbol* symbol, const QgsVectorLayer* vl, QWidget* parent /TransferThis/ = NULL );

    /** Returns the expression context used for the widget, if set. This expression context is used for
     * evaluating data defined symbol properties and for populating based expression widgets in
     * the properties widget.
     * @note added in QGIS 2.12
     * @see setExpressionContext()
     */
    QgsExpressionContext* expressionContext() const;

    /** Sets the map canvas associated with the widget. This allows the widget to retrieve the current
     * map scale and other properties from the canvas.
     * @param canvas map canvas
     * @note added in QGIS 2.12
     */
    virtual void setMapCanvas( QgsMapCanvas* canvas );

  public slots:
    void layerTypeChanged();
    void emitSignalChanged();

    /** Sets the optional expression context used for the widget. This expression context is used for
     * evaluating data defined symbol properties and for populating based expression widgets in
     * the properties widget.
     * @param context expression context pointer. Ownership is not transferred and the object must
     * be kept alive for the lifetime of the properties widget.
     * @note added in QGIS 2.12
     * @see expressionContext()
     */
    void setExpressionContext( QgsExpressionContext* context );

  signals:
    void changed();
    void changeLayer( QgsSymbolLayer* );

  protected:
    void populateLayerTypes();
    void updateSymbolLayerWidget( QgsSymbolLayer* layer );
};
